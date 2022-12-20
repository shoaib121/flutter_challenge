import 'package:flutter_challenge/src/data/datasource/user_datasource.dart';
import 'package:flutter_challenge/src/data/datasource/user_datasource_impl.dart';
import 'package:flutter_challenge/src/data/repository/user_repository_impl.dart';
import 'package:flutter_challenge/src/domain/repository/user_repository.dart';
import 'package:riverpod/riverpod.dart';

final userDatasourceProvider =
    Provider<UserDatasource>((ref) => UserDatasourceImpl());

final userReposotoryProvider = Provider<UserRepository>((ref) =>
    UserRepositoryImpl(userDatasource: ref.read(userDatasourceProvider)));
