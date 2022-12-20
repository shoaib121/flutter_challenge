import '../../../domain/entity/user_entity.dart';

class UserViewModel {
  final int id;
  final String name;
  final String email;
  bool isFavorite;

  UserViewModel({
    required this.id,
    required this.name,
    required this.email,
  }) : isFavorite = false;

  factory UserViewModel.fromEntity(UserEntity userDTO) => UserViewModel(
        id: userDTO.id,
        name: userDTO.name,
        email: userDTO.email,
      );
}
