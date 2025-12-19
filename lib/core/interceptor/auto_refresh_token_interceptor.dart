import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_crew/core/exception/api_response_exception.dart';
import 'package:project_crew/core/shared/internal_storage.dart';
import 'package:project_crew/core/util/jwt_util.dart';
import 'package:project_crew/data/api/remote/auth_api_service.dart';
import 'package:project_crew/domain/entity/auth/account/account_entity.dart';
import 'package:project_crew/domain/params/auth/refresh/refresh_token_params.dart';

const kAutoRefreshTokenCustomError = 40101;

class AutoRefreshTokenInterceptor extends Interceptor {
  AutoRefreshTokenInterceptor({
    required this.authApiService,
    required this.dio,
    required this.excludeEndpoint,
  });

  final AuthApiService authApiService;
  final Dio dio;
  final List<String> excludeEndpoint;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// exclude list, require no auth token send
    if (excludeEndpoint.contains(options.path)) return handler.next(options);

    /// optional send token
    var accountInfo = await GetIt.instance<InternalStorage>().getToken();
    if (accountInfo.accessToken.isEmpty) {
      debugPrint('auth token empty');

      /// pass through server. (error response sever)
      return handler.next(options);
    }

    /// check token expiry
    var isTokenExpiry = await JwtUtil().isTokenExpiry(accountInfo.accessToken);
    if (isTokenExpiry) {
      debugPrint('auth header token expiry');
      final error = DioException(
        requestOptions: options,
        message: 'local authorization error : token expiry',
        response: Response(
          requestOptions: options,
          statusCode: kAutoRefreshTokenCustomError,
          statusMessage: 'local authorization error : token expiry',
        ),
      );
      return handler.reject(error, options.extra['Auto-Refresh-Retry'] ?? true);
    }

    /// all green.
    debugPrint('auth all green! Add Authorization header');
    options.headers['Authorization'] = 'Bearer ${accountInfo.accessToken}';
    return handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != kAutoRefreshTokenCustomError) return handler.next(err);

    /// handle token refresh api
    try {
      _refresh(
          requestOptions: err.requestOptions, responseHandler: null, errorHandler: handler);
    } on DioException catch (e) {
      debugPrint('reject');
      return handler.reject(e);
    }
  }

  Future<void> _refresh({
    required RequestOptions requestOptions,
    ResponseInterceptorHandler? responseHandler,
    ErrorInterceptorHandler? errorHandler,
  }) async {
    try {
      var oldAccountInfo = await GetIt.instance<InternalStorage>().getToken();

      var result = await authApiService.fetchRefreshToken(
        RefreshTokenParams(refreshToken: oldAccountInfo.refreshToken),
      );

      /// save new token
      var saveAccountInfo = result.result as AccountEntity;
      await GetIt.instance<InternalStorage>().saveToken(
        saveAccountInfo.refreshToken,
        saveAccountInfo.accessToken,
      );

      requestOptions.headers['Authorization'] =
          'Bearer ${saveAccountInfo.accessToken}';
      requestOptions.extra['Auto-Refresh-Retry'] = false;

      /// original req retry, web = required header allow check
      var retryResponse = await dio.fetch(requestOptions);
      return responseHandler != null
          ? responseHandler.resolve(retryResponse)
          : errorHandler?.resolve(retryResponse);
    } on DioException catch (e) {
      /// error
      var response = Response(requestOptions: requestOptions);
      return responseHandler != null
          ? responseHandler.resolve(response)
          : errorHandler?.reject(e);
    } on ApiResponseException catch (e1) {
      debugPrint('fetchRefreshToken ApiResponseException: $e1');
      if (e1.reason.code == 401) {
        await GetIt.instance<InternalStorage>().deleteToken();
      } else {
        rethrow;
      }
    }
  }
}
