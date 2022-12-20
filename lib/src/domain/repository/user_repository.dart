import 'package:either_dart/either.dart';

import '../entity/user_entity.dart';

abstract class UserRepository {
  Future<Either<Error, List<UserEntity>>> getUsers();
}
