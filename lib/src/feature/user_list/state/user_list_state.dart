import 'package:flutter_challenge/src/feature/user_list/model/user_view_model.dart';

abstract class UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<UserViewModel> users;

  UserListLoaded({
    required this.users,
  });
}

class UserListError extends UserListState {}
