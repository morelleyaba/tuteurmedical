import '../../domain/params/auth_params.dart';

abstract class AuthRemoteDatasource {
  // la fonction "loginUser" creé ici sera utilisé dans "AuthRemoteDatasourceImpl", 
  //il sera egalement utilisé dans AuthRepositoryImpl comme nom de fonction lors de l'appel de fonction connexion
  
  Future<Map<String, dynamic>> loginUser(AuthParams authParams); 
  Future<Map<String, dynamic>> getProfile();
}

// Il dit :
// “Voilà ce que je sais faire, peu importe comment.”
// 📌 Aucune dépendance à Dio ici
// 📌 Aucune logique technique