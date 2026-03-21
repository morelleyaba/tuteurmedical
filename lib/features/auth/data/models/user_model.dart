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

// quand un element extends sur un autre, c'est qu'il utilise egalement les données de l'autre aussi,
// du coup pas besoin de repéter les declaration des variables commun, on peux ajouter ceux qu'on ne retrouve pas dans la classe extendu (ajouter les comme ":super()")