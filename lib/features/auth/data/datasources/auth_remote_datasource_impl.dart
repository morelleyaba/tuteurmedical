import '../../../../core/network/api_provider.dart';
import '../../domain/params/auth_params.dart';
import 'auth_remote_datasource.dart';

// le dataResource lance l'appel des apis et repository_impl va decider de quoi en faire 
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiProvider api;

  AuthRemoteDatasourceImpl(this.api);

// la fonction "loginUser" creé ici sera utilisé dans "AuthRemoteDatasourceImpl"
  Future<Map<String, dynamic>> loginUser(
    AuthParams authParams
  ) async{
    final response = await api.dio.post(
      "/login", 
      data: {
        "email":authParams.email,
        "password": authParams.password,
      });

      return response.data;
      // Grâce à la séparation de "AuthRemoteDataSource" et "AuthRemoteDatasourceImpl", on peux faire :
            // return {
            //   "token": "fake_token",
            //   "data": {
            //     "id": "1",
            //     "email": email,
            //     "nom": "Test",
            //   }
            // };
      // au lieu de "return response.data"
      // la reponse retournée sera utilisée dans repositoryImpl comme reponse de, "final result = await remote.loginUser(authParams);"
  }

  Future<Map<String, dynamic>> getProfile() async{
    final response = await api.dio.get(
      "/profile"
      );
    return response.data;
  }
}
