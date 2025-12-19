import 'package:project_crew/core/usecase/failure.dart';

class ApiResponseException implements Exception {
  ApiResponseException({
    required this.reason,
  });

  final Failure reason;

  @override
  String toString() {
    return 'ApiResponseException: $reason';
  }
}
