import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:project_crew/core/usecase/failure.dart';
import 'package:project_crew/core/usecase/usecase.dart';
import 'package:project_crew/domain/params/auth/reset/reset_password_params.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';

@Injectable()
class ResetPasswordUseCase extends UseCase<void, ResetPasswordParams> {
  ResetPasswordUseCase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(ResetPasswordParams params) async {
    try {
      final result = await authRepository.resetPassword(params);
      if (result.code >= 200 && result.code < 300) {
        return const Right(null);
      }
      return Left(UnknownFailure());
    } catch (_) {
      return Left(UnknownFailure());
    }
  }
}


