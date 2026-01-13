import '../repositories/auth_repository.dart';

class IsLoggedInUseCase {
  AuthRepository repository;

  IsLoggedInUseCase(this.repository);

  Future<bool> call() {
    return repository.isLoggedIn();
  }
}