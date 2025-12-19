import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:project_crew/core/usecase/failure.dart';
import 'package:project_crew/core/usecase/usecase.dart';
import 'package:project_crew/domain/params/auth/reset/verify_reset_code_params.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';

@Injectable()
class VerifyResetCodeUseCase extends UseCase<void, VerifyResetCodeParams> {
  VerifyResetCodeUseCase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(VerifyResetCodeParams params) async {
    try {
      final result = await authRepository.verifyResetCode(params);
      if (result.code >= 200 && result.code < 300) {
        return const Right(null);
      }
      return Left(
        ServerFailure(
          code: result.code,
          message: result.message.isNotEmpty ? result.message : 'verifyResetCode failed',
        ),
      );
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}


