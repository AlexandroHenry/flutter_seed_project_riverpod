import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_crew/core/exception/api_response_exception.dart';
import 'package:project_crew/core/shared/internal_storage.dart';
import 'package:project_crew/core/usecase/failure.dart';
import 'package:project_crew/core/usecase/usecase.dart';
import 'package:project_crew/domain/entity/auth/account/account_entity.dart';
import 'package:project_crew/domain/params/auth/login/login_params.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';

@Injectable()
class LoginUseCase extends UseCase<AccountEntity, LoginParams> {
  LoginUseCase({required this.authRepository, required this.internalStorage});

  final AuthRepository authRepository;
  final InternalStorage internalStorage;

  @override
  Future<Either<Failure, AccountEntity>> call(LoginParams params) async {
    try {
      final result = await authRepository.login(params);

      // 실패 응답 처리 (예: user-not-found, wrong-password 등)
      if (result.code != 200 || result.result == null) {
        final friendly = _mapAuthErrorToMessage(result.error, result.message);
        return Left(
          ServerFailure(
            code: result.code,
            message: friendly,
          ),
        );
      }

      // 이메일 인증 체크
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        // 인증되지 않은 경우 로그아웃
        await FirebaseAuth.instance.signOut();
        return Left(
          ServerFailure(
            code: 400,
            message: '이메일 인증이 완료되지 않았습니다. 메일함을 확인해 주세요.',
          ),
        );
      }

      await _saveToken(result.result.refreshToken, result.result.accessToken);

      return Right(result.result);
    } on ApiResponseException catch (e) {
      return Left(e.reason);
    } catch (e1) {
      return Left(UnknownFailure());
    }
  }

  Future<void> _saveToken(String refreshToken, String accessToken) async {
    await internalStorage.saveToken(refreshToken, accessToken);
  }

  String _mapAuthErrorToMessage(String errorCode, String fallbackMessage) {
    switch (errorCode) {
      case 'invalid-credential':
        // Firebase가 보안을 위해 존재하지 않는 계정/잘못된 비밀번호를 통합하여 반환하는 경우
        return '이메일 또는 비밀번호가 올바르지 않습니다.';
      case 'user-not-found':
        return '가입되지 않은 이메일입니다.';
      case 'wrong-password':
        return '비밀번호가 올바르지 않습니다.';
      case 'invalid-email':
        return '올바른 이메일 형식이 아닙니다.';
      case 'user-disabled':
        return '비활성화된 계정입니다. 관리자에게 문의해 주세요.';
      case 'too-many-requests':
        return '요청이 너무 많습니다. 잠시 후 다시 시도해 주세요.';
      case 'missing-email':
      case 'missing-password':
        return '이메일과 비밀번호를 입력해 주세요.';
      default:
        // 저장된 메시지가 있으면 사용, 없으면 일반 메시지
        return (fallbackMessage.isNotEmpty)
            ? fallbackMessage
            : '로그인에 실패했습니다. 잠시 후 다시 시도해 주세요.';
    }
  }
}
