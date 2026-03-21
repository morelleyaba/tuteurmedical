import 'user_model.dart';

class AuthResponseModel {
  final String? token;
  final UserModel? user;

  AuthResponseModel({ this.token, this.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'],
      user: UserModel.fromJson(json['data']),
    );
  }
}
// on peut avoir un model sans entity , ex : ce model ci
// Reponse Api, DTO ( Data Transfer Object), Donnée de pagination, Token d'authentification