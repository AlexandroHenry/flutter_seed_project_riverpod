import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:project_crew/core/interceptor/auto_refresh_token_interceptor.dart';
import 'package:project_crew/data/api/config/api_config.dart';
import 'package:project_crew/data/api/remote/auth_api_service.dart';
import 'package:project_crew/data/model/response/response_model.dart';
import 'package:project_crew/domain/entity/auth/account/account_entity.dart';
import 'package:project_crew/domain/params/auth/login/login_params.dart';
import 'package:project_crew/domain/params/auth/refresh/refresh_token_params.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@LazySingleton(as: AuthApiService, env: [Environment.prod, 'stg'])
class AuthApiServiceImpl extends AuthApiService {
  AuthApiServiceImpl({required this.dio, required this.apiConfig});

  final Dio dio;
  final ApiConfig apiConfig;

  final cacheOptions = CacheOptions(
    store: MemCacheStore(),
    hitCacheOnErrorCodes: [401, 403, 500],
    policy: CachePolicy.request,
  );

  @PostConstruct(preResolve: false)
  void init() {
    dio.options.headers = apiConfig.headers;

    // debug mode logging
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: false,
          maxWidth: 90,
        ),
      );
    }

    // http cache policy
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    // Auto Refresh
    dio.interceptors.add(
      AutoRefreshTokenInterceptor(
        authApiService: this,
        dio: dio,
        excludeEndpoint: apiConfig.optionalAuth(),
      ),
    );

    dio.addSentry(
      failedRequestStatusCodes: [
        SentryStatusCode(400),
        SentryStatusCode(403),
        SentryStatusCode(404),
        SentryStatusCode(500),
      ],
    );
  }

  @override
  Future<ResponseModel> login(LoginParams params) async {
    try {
      var response = await dio.post(
        apiConfig.login,
        data: params.toJson(),
      );
      return ResponseModel<AccountEntity>(
        code: response.statusCode ?? 0,
        result: AccountEntity.fromJson(response.data as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw makeCommonException(e);
    }
  }

  @override
  Future<ResponseModel> fetchRefreshToken(RefreshTokenParams params) async {
    try {
      var response = await dio.post(
        apiConfig.refreshToken,
        data: params.toJson(),
      );
      return ResponseModel<AccountEntity>(
        code: response.statusCode ?? 0,
        result: AccountEntity.fromJson(response.data as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw makeCommonException(e);
    }
  }
}
