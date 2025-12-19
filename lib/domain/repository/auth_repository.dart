
import 'package:project_crew/data/model/response/response_model.dart';
import 'package:project_crew/domain/params/auth/login/login_params.dart';
import 'package:project_crew/domain/params/auth/signup/sign_up_params.dart';
import 'package:project_crew/domain/params/auth/reset/reset_password_params.dart';
import 'package:project_crew/domain/params/auth/reset/request_reset_code_params.dart';
import 'package:project_crew/domain/params/auth/reset/verify_reset_code_params.dart';
import 'package:project_crew/domain/params/auth/reset/update_password_with_code_params.dart';
import 'package:project_crew/domain/params/auth/signup/request_signup_code_params.dart';
import 'package:project_crew/domain/params/auth/signup/verify_signup_code_params.dart';

abstract class AuthRepository {
  Future<ResponseModel> login(LoginParams params);
  Future<ResponseModel> signUp(SignUpParams params);
  Future<ResponseModel> resetPassword(ResetPasswordParams params);
  Future<ResponseModel> requestResetCode(RequestResetCodeParams params);
  Future<ResponseModel> verifyResetCode(VerifyResetCodeParams params);
  Future<ResponseModel> updatePasswordWithCode(UpdatePasswordWithCodeParams params);
  Future<ResponseModel> requestSignupCode(RequestSignupCodeParams params);
  Future<ResponseModel> verifySignupCode(VerifySignupCodeParams params);
  Future<void> logout();
}