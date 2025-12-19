import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:project_crew/core/shared/internal_storage.dart';
import 'package:project_crew/core/usecase/failure.dart';
import 'package:project_crew/core/usecase/usecase.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';

@Injectable()
class LogoutUseCase extends UseCase<void, void> {
  LogoutUseCase({required this.authRepository, required this.internalStorage});

  final AuthRepository authRepository;
  final InternalStorage internalStorage;

  @override
  Future<Either<Failure, void>> call(void params) async {
    try {
      await authRepository.logout();
      await internalStorage.deleteToken();
      return const Right(null);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }
}


