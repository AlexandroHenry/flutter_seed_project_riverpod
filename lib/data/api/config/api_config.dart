abstract class ApiConfig {
  Map<String, dynamic> get headers => {
    'Content-Type': 'application/json',
  };

  /// Base Group
  String get baseUrl;
  String get apiPath;
  String get v1Path;
  String get v2Path;

  /// Sign-In
  String get login;
  String get refreshToken;

  /// Init
  String get version;

  List<String> optionalAuth();
}