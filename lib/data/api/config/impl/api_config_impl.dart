import 'package:project_crew/constants.dart';
import 'package:project_crew/data/api/config/api_config.dart';

class ApiConfigImpl extends ApiConfig {
  ApiConfigImpl({
    String? overrideBaseUrl,
  }) : _baseUrl = overrideBaseUrl ?? kApiBaseUrl;

  final String _baseUrl;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get apiPath => '/api';

  @override
  String get v1Path => '/v1';

  @override
  String get v2Path => '/v2';

  @override
  String get login => '$baseUrl$apiPath$v1Path/auth/login';

  @override
  String get refreshToken => '$baseUrl$apiPath$v1Path/auth/refresh';

  @override
  String get version => '$baseUrl$apiPath$v1Path/version';

  @override
  List<String> optionalAuth() {
    return [
      refreshToken,
      version,
    ];
  }
}


