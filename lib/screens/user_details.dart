import 'package:flutter/material.dart';
import 'package:github/model/user.dart';
import 'package:github/provider/user_provider.dart';
import 'package:github/screens/followers_list.dart';
import 'package:github/screens/following_list.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatefulWidget {
  String userName;
  UserDetails({Key? key, required this.userName}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  var _init = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<UserProvider>(context)
          .getUserProfile(widget.userName)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          user?.username ?? "User Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : user == null
              ? Center(
                  child: Text("User not found"),
                )
              : UserDetailsContent(user: user),
    );
  }
}

class UserDetailsContent extends StatelessWidget {
  final User user;

  UserDetailsContent({required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 55,
                  backgroundImage: NetworkImage(
                    user.imageUrl ?? "",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  user.username.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "Joined at ${user.joined_date ?? ""}",
                  style: TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FollowersList(
                        username: user.username ?? "",
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      user.followers.toString(),
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Following ",
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FollowingList(
                        username: user.username ?? "",
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      user.following.toString(),
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Following ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // SizedBox(height: 14),
        ],
      ),
    );
  }
}
