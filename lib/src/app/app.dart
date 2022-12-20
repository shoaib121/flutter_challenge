import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/feature/user_list/page/user_list_page.dart';

class FlutterChallengeApplication extends StatelessWidget {
  const FlutterChallengeApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: UserListPage());
  }
}
