import 'package:either_dart/src/either.dart';

import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../datasource/user_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource userDatasource;

  UserRepositoryImpl({required this.userDatasource});

  @override
  Future<Either<Error, List<UserEntity>>> getUsers() async {
    try {
      final users = await userDatasource.getUsers();
      return Right(users);
    } catch (_) {
      rethrow;
    }
  }
}
