import 'package:flutter_challenge/src/domain/entity/user_entity.dart';

class UserDTO {
  final int id;
  final String name;
  final String username;
  final String email;

  UserDTO({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
      );

  UserEntity toUserEntity() => UserEntity(
        id: id,
        name: name,
        username: username,
        email: email,
      );
}
