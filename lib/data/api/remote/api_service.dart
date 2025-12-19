import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:project_crew/core/exception/api_response_exception.dart';
import 'package:project_crew/core/extension/dio_exception_x.dart';
import 'package:project_crew/core/usecase/failure.dart';

abstract class ApiService extends BaseApiService {

}

abstract class BaseApiService {

  ApiResponseException makeCommonException(DioException e) {
    try {
      switch (e.type) {
        case DioExceptionType.badResponse:
          return ApiResponseException(
            reason: ServerFailure(
              code: e.response?.statusCode ?? -1,
              message: tryOrGetMessage(e.response) ??
                e.response?.statusMessage ?? (e.message ?? ''),
            ),
          );
        case DioExceptionType():
          return ApiResponseException(
            reason: NetworkFailure(
              code: e.response?.statusCode ?? e.type.toDioException(),
              message: tryOrGetMessage(e.response) ??
                  e.response?.statusMessage ?? (e.message ?? ''),
            ),
          );
      }
    } catch (e) {
      return ApiResponseException(reason: const UnknownFailure());
    }
  }

  String? tryOrGetMessage(Response? response) {
    if (response == null) return null;
    try {
      var data = jsonDecode(response.toString());
      if (data['message'] is List<dynamic>) {
        var list = data['message'] as List<dynamic>;
        if (list.isEmpty) return null;
        if (list.length == 1) {
          return list.first;
        } else {
          var result = '';
          list.forEachIndexed((index, ele) {
            if (index == (list.length - 1)) {
              result += ele;
            } else {
              result += (ele + '\n');
            }
          });
          return result;
        }
      } else {
        return data['message'].toString();
      }
    } catch (e) {
      return null;
    }
  }
}