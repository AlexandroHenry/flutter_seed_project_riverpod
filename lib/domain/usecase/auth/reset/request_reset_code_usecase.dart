import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:project_crew/core/usecase/failure.dart';
import 'package:project_crew/core/usecase/usecase.dart';
import 'package:project_crew/domain/params/auth/reset/request_reset_code_params.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';

@Injectable()
class RequestResetCodeUseCase
    extends UseCase<void, RequestResetCodeParams> {
  RequestResetCodeUseCase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(RequestResetCodeParams params) async {
    try {
      final result = await authRepository.requestResetCode(params);
      if (result.code >= 200 && result.code < 300) {
        return const Right(null);
      }
      return Left(
        ServerFailure(
          code: result.code,
          message: result.message.isNotEmpty ? result.message : 'requestResetCode failed',
        ),
      );
    } catch (_) {
      return const Left(
        UnknownFailure(),
      );
    }
  }
}


