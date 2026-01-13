import 'package:tuteur_medical/features/auth/domain/params/auth_params.dart';

import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository; 

  LoginUseCase(this.repository);
  
  Future<User> call (AuthParams authParams){
    // Ici on peut ajouter des règles métier
    if (authParams.email.isEmpty && authParams.password.isEmpty) {
      throw Exception("Email ou mot de passe vide");
    }

// la fonction "login" utilisé ici vient de repository, il sera egalement utilisé dans AuthRepositoryImpl comme nom de fonction "Future<?>"
    return repository.login(authParams); 
  }
} 