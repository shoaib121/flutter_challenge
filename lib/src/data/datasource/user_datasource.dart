import 'package:flutter_challenge/src/domain/entity/user_entity.dart';

abstract class UserDatasource {
  Future<List<UserEntity>> getUsers();
}
