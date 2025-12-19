import 'package:project_crew/data/api/remote/api_service.dart';
import 'package:project_crew/data/model/response/response_model.dart';
import 'package:project_crew/domain/params/auth/login/login_params.dart';
import 'package:project_crew/domain/params/auth/refresh/refresh_token_params.dart';

abstract class AuthApiService extends BaseApiService {
  Future<ResponseModel> login(LoginParams params);
  Future<ResponseModel> fetchRefreshToken(RefreshTokenParams params);
}