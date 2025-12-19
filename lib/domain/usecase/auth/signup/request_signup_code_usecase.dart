import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:project_crew/core/usecase/failure.dart';
import 'package:project_crew/core/usecase/usecase.dart';
import 'package:project_crew/domain/params/auth/signup/request_signup_code_params.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';

@Injectable()
class RequestSignupCodeUseCase extends UseCase<void, RequestSignupCodeParams> {
  RequestSignupCodeUseCase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(RequestSignupCodeParams params) async {
    try {
      final result = await authRepository.requestSignupCode(params);
      if (result.code >= 200 && result.code < 300) {
        return const Right(null);
      }
      return Left(
        ServerFailure(
          code: result.code,
          message: result.message.isNotEmpty ? result.message : 'requestSignupCode failed',
        ),
      );
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}


