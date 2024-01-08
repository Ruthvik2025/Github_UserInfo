import 'package:flutter/material.dart';
import 'package:github/provider/user_provider.dart';
import 'package:provider/provider.dart';

class FollowingList extends StatelessWidget {
  final String username;

  FollowingList({required this.username});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Fetch following list when the widget is built
    userProvider.getFollowingList(username);
    return Scaffold(
      appBar: AppBar(
        title: Text("Following"),
      ),
      body: Consumer<UserProvider>(
        builder: (context, UserProvider, _) {
          final followingList = userProvider.followingList;

          if (followingList.isEmpty) {
            return Center(
              child: Text("No Following"),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final following = followingList[index];
                return ListTile(
                  title: Text(following.username ?? ""),
                );
              },
              itemCount: followingList.length,
            );
          }
        },
      ),
    );
  }
}
