import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:project_crew/core/exception/api_response_exception.dart';
import 'package:project_crew/core/usecase/failure.dart';
import 'package:project_crew/data/api/remote/auth_api_service.dart';
import 'package:project_crew/data/model/response/response_model.dart';
import 'package:project_crew/domain/entity/auth/account/account_entity.dart';
import 'package:project_crew/domain/params/auth/login/login_params.dart';
import 'package:project_crew/domain/params/auth/refresh/refresh_token_params.dart';

@LazySingleton(as: AuthApiService, env: [Environment.dev, Environment.test])
class AuthApiServiceMock extends AuthApiService {
  @override
  Future<ResponseModel<AccountEntity>> login(LoginParams params) async {
    await Future<void>.delayed(const Duration(milliseconds: 1200));

    final String id = params.id.trim();
    final String pw = params.password.trim();

    if (id.isEmpty || pw.isEmpty) {
      throw ApiResponseException(
        reason: const ServerFailure(code: 400, message: '아이디/비밀번호를 입력해 주세요.'),
      );
    }

    // Simple mock rule: succeed when id == 'test' and password == 'test'
    final bool isValid = id == 'test' && pw == 'test';

    if (!isValid) {
      throw ApiResponseException(
        reason: const ServerFailure(code: 401, message: '아이디 또는 비밀번호가 올바르지 않습니다.'),
      );
    }

    return ResponseModel<AccountEntity>(
      code: 200,
      result: const AccountEntity(
        accessToken: 'mock_access_token',
        refreshToken: 'mock_refresh_token',
      ),
    );
  }

  @override
  Future<ResponseModel> fetchRefreshToken(RefreshTokenParams params) async {
    await Future<void>.delayed(const Duration(milliseconds: 1200));

    return ResponseModel<AccountEntity>(
      code: 200,
      result: const AccountEntity(
        accessToken: 'mock_access_token',
        refreshToken: 'mock_refresh_token',
      ),
    );
  }
}

