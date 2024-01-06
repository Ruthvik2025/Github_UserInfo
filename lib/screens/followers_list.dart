import 'package:flutter/material.dart';
import 'package:github/provider/user_provider.dart';
import 'package:provider/provider.dart';

class FollowersList extends StatelessWidget {
  final String username;

  FollowersList({required this.username});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Fetch followers list when the widget is built
    userProvider.getFollowersList(username);

    return Scaffold(
      appBar: AppBar(
        title: Text("Followers"),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          final followersList = userProvider.followersList;

          if (followersList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final follower = followersList[index];
                return ListTile(
                  title: Text(follower.username ?? ""),
                  // Add other details you want to display
                );
              },
              itemCount: followersList.length,
            );
          }
        },
      ),
    );
  }
}
