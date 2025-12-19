import 'package:dartz/dartz.dart';
import 'package:project_crew/core/exception/api_response_exception.dart';
import 'package:project_crew/core/shared/internal_storage.dart';
import 'package:project_crew/core/usecase/failure.dart';
import 'package:project_crew/core/usecase/usecase.dart';
import 'package:project_crew/domain/entity/auth/account/account_entity.dart';
import 'package:project_crew/domain/params/auth/signup/sign_up_params.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SignUpUseCase extends UseCase<AccountEntity, SignUpParams> {
  SignUpUseCase({required this.authRepository, required this.internalStorage});

  final AuthRepository authRepository;
  final InternalStorage internalStorage;

  @override
  Future<Either<Failure, AccountEntity>> call(SignUpParams params) async {
    try {
      final result = await authRepository.signUp(params);
      return Right(result.result as AccountEntity);
    } on ApiResponseException catch (e) {
      return Left(e.reason);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }

  // Note: Do NOT persist tokens on sign-up; user must verify email first.
}


