import 'package:dio/dio.dart';

extension DioExceptionTypeX on DioExceptionType {
  int toDioException() {
    switch (this) {
      case DioExceptionType.connectionTimeout:
        return 80001;
      case DioExceptionType.sendTimeout:
        return 80002;
      case DioExceptionType.receiveTimeout:
        return 80003;
      case DioExceptionType.badCertificate:
        return 80004;
      case DioExceptionType.badResponse:
        return 80005;
      case DioExceptionType.cancel:
        return 80006;
      case DioExceptionType.connectionError:
        return 80007;
      case DioExceptionType.unknown:
        return 80008;
    }
  }
}

extension DioExceptionCodeX on int {
  bool isDioException() {
    if (this >= 80001 && this <= 80008) {
      return true;
    } else {
      return false;
    }
  }
}