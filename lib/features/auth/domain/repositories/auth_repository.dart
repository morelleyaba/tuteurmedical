import '../../domain/entities/user.dart';
import '../params/auth_params.dart';

// Defini ce qu'on peut faire avec l'authentification
/// Authentication repository contract
abstract class AuthRepository {
  // la fonction "login" creé ici sera utilisé dans useCase
  Future<User> login(AuthParams authParams); //retourne un User 
  Future<User> register(String email, String password, String name);
  Future<void> logout();
  Future<User> getCurrentUser();
  Future<bool> isLoggedIn();
}
