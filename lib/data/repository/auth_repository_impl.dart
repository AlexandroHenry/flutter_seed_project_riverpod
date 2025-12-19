import 'package:injectable/injectable.dart';
import 'package:project_crew/data/api/remote/api_service.dart';
import 'package:project_crew/data/api/remote/auth_api_service.dart';
import 'package:project_crew/data/model/response/response_model.dart';
import 'package:project_crew/domain/params/auth/login/login_params.dart';
import 'package:project_crew/domain/params/auth/signup/sign_up_params.dart';
import 'package:project_crew/domain/params/auth/reset/reset_password_params.dart';
import 'package:project_crew/domain/params/auth/reset/request_reset_code_params.dart';
import 'package:project_crew/domain/params/auth/reset/verify_reset_code_params.dart';
import 'package:project_crew/domain/params/auth/reset/update_password_with_code_params.dart';
import 'package:project_crew/domain/params/auth/signup/request_signup_code_params.dart';
import 'package:project_crew/domain/params/auth/signup/verify_signup_code_params.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {

  AuthRepositoryImpl({
    required this.apiService,
    required this.authApiService,
  });

  final ApiService apiService;
  final AuthApiService authApiService;

  @override
  Future<ResponseModel> login(LoginParams params) async {
    return await authApiService.login(params);
  }

  @override
  Future<ResponseModel> signUp(SignUpParams params) {
    throw UnsupportedError('signUp is not supported for API repository');
  }

  @override
  Future<ResponseModel> resetPassword(ResetPasswordParams params) {
    throw UnsupportedError('resetPassword is not supported for API repository');
  }

  @override
  Future<ResponseModel> requestResetCode(RequestResetCodeParams params) {
    throw UnsupportedError('requestResetCode is not supported for API repository');
  }

  @override
  Future<ResponseModel> verifyResetCode(VerifyResetCodeParams params) {
    throw UnsupportedError('verifyResetCode is not supported for API repository');
  }

  @override
  Future<ResponseModel> updatePasswordWithCode(UpdatePasswordWithCodeParams params) {
    throw UnsupportedError('updatePasswordWithCode is not supported for API repository');
  }

  @override
  Future<ResponseModel> requestSignupCode(RequestSignupCodeParams params) {
    throw UnsupportedError('requestSignupCode is not supported for API repository');
  }

  @override
  Future<ResponseModel> verifySignupCode(VerifySignupCodeParams params) {
    throw UnsupportedError('verifySignupCode is not supported for API repository');
  }

  @override
  Future<void> logout() async {
    // No-op for API repository
  }
}