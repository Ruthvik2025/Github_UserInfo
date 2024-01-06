import 'package:flutter/material.dart';
import 'package:github/model/user.dart';

class UserDetailsContent extends StatelessWidget {
  final User user;

  UserDetailsContent({required this.user});

  @override
  Widget build(BuildContext context) {
    print(user);
    print(user.username);
    return Scaffold(
      body: Text(user.username.toString()),
    );
  }
}
