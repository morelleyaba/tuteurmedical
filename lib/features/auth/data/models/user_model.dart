import '../../domain/entities/user.dart';

/// User data model
class UserModel extends User {
  UserModel({
    required String id,
    required String email,
    required String name,
    String? niveau,
    DateTime? dateCreation,
  }) : super(id: id, email: email, name: name, niveau: niveau, dateCreation: dateCreation);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      niveau: json['niveau'],
      dateCreation: json['dateCreation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'niveau': niveau,
      'dateCreation': dateCreation,
    };
  }

  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
      niveau: niveau,
      dateCreation: dateCreation,
    );
  }
}
