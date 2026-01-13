import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<User> call() {
    return repository.getCurrentUser();
  }
}