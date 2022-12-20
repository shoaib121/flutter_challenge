import 'package:flutter_challenge/src/domain/usecase/get_user_list_usecase.dart';
import 'package:flutter_challenge/src/feature/user_list/model/user_view_model.dart';
import 'package:flutter_challenge/src/feature/user_list/state/user_list_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../../data/di/providers.dart';

class UserListProvider extends StateNotifier<UserListState> {
  final GetUserListUseCase useCase;
  UserListProvider({required this.useCase}) : super(UserListLoading()) {
    getUsers();
  }

  Future getUsers() async {
    state = UserListLoading();
    final result = await useCase.invoke();
    result.fold(
        (left) => {state = UserListError()},
        (users) => {
              state = UserListLoaded(
                  users: users.map((e) => UserViewModel.fromEntity(e)).toList())
            });
  }

  void toggleFavorite(UserViewModel userViewModel) {
    userViewModel.isFavorite = !userViewModel.isFavorite;
    final users = (state as UserListLoaded).users;
    users[users.indexWhere((user) => user.id == userViewModel.id)] =
        userViewModel;
    state = UserListLoaded(users: users);
  }
}

final userListStateProvider =
    StateNotifierProvider<UserListProvider, UserListState>((ref) =>
        UserListProvider(
            useCase: GetUserListUseCase(ref.read(userReposotoryProvider))));
