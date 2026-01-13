import '../../../../core/utils/hive/hive_utils.dart';
import '../../domain/params/auth_params.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

// dans ce fichier on parlera de ce qu'on va faire de la reponse recu 
//de l'appel de l'api qui a eu lieu dans le fichier "AuthRemoteDataSource" / 
//ce fichier peut communiquer avec les donnée exterieur comme non si il n'y a ^pas de besoin
// apres les implementations de ce fichier, on part maitenant dans cubit 

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;

AuthRepositoryImpl({required this.remote});

  @override
  Future<User> login(AuthParams authParams) async { // fonction "login utilisé dans useCase"
    try {

// la fonction "login" utilisé ici , vient de "AuthRemoteDatasourceImpl" et "AuthRemoteDatasource"
      final result = await remote.loginUser(authParams);
      final token = result["token"];
      final userJson = result["data"];

      if (token == null || userJson == null){
        throw Exception("Réponse invalide");
      }

     // 🔐 sauvegarde du token
      await HiveUtils.saveToken(token);

    // 🔁 mapping Model → Entity
    //  la reponse qu'on va decidé de retourner ici sera utilisé dans 
    //  cubit comme reponse de "final result = await loginUseCase(authParams);"
      return UserModel.fromJson(userJson); // on avait declaré dans use case que xa doit retourner un User 
      
    } catch (e) {
      throw Exception("Connexion échouée");
    }

  }

@override
  Future<User> getCurrentUser() async {
    try {
      final result = await remote.getProfile();
      final userData = result["data"];
      return UserModel.fromJson(userData);
    } catch (e) {
      throw Exception("User not authenticated");
    }
  }

  @override
  Future<void> logout() async {
    await HiveUtils.logOut();
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = HiveUtils.getToken();
    return token != null && token.isNotEmpty; // on avait declaré dans use case que xa doit retourner un boléen 
  }

  @override
  Future<User> register(String email, String password, String name) {
    throw UnimplementedError();
  }
}
