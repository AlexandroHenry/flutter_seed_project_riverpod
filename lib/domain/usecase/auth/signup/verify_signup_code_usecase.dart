import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:project_crew/core/usecase/failure.dart';
import 'package:project_crew/core/usecase/usecase.dart';
import 'package:project_crew/domain/params/auth/signup/verify_signup_code_params.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';

@Injectable()
class VerifySignupCodeUseCase extends UseCase<void, VerifySignupCodeParams> {
  VerifySignupCodeUseCase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(VerifySignupCodeParams params) async {
    try {
      final result = await authRepository.verifySignupCode(params);
      if (result.code >= 200 && result.code < 300) {
        return const Right(null);
      }
      return Left(
        ServerFailure(
          code: result.code,
          message: result.message.isNotEmpty ? result.message : 'verifySignupCode failed',
        ),
      );
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}


