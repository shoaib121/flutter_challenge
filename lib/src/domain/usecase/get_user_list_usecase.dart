import 'package:either_dart/src/either.dart';
import 'package:flutter_challenge/src/domain/entity/user_entity.dart';
import 'package:flutter_challenge/src/domain/repository/user_repository.dart';
import 'package:flutter_challenge/src/domain/usecase/usecase.dart';

class GetUserListUseCase extends UseCase<List<UserEntity>> {
  final UserRepository userRepository;

  GetUserListUseCase(this.userRepository);
  @override
  Future<Either<Error, List<UserEntity>>> invoke() => userRepository.getUsers();
}
