import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/feature/user_list/state/user_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../provider/user_list_provider.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final state = ref.watch(userListStateProvider);
        if (state is UserListLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserListLoaded) {
          final users = state.users;
          return ListView.builder(itemBuilder: (_, index) {
            final user = users[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        user.name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    IconButton(
                        onPressed: () => {
                              ref
                                  .read(userListStateProvider.notifier)
                                  .toggleFavorite(user)
                            },
                        icon: Icon(user.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline))
                  ],
                ),
                const SizedBox(height: 4),
                Text(user.email),
              ],
            );
          });
        } else {
          return const Center(child: Text('An error occurred'));
        }
      },
    );
  }
}
