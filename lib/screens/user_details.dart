import 'package:flutter/material.dart';
import 'package:github/model/user.dart';
import 'package:github/provider/user_provider.dart';
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
    super.didChangeDependencies();
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
    // double screenSize = MediaQuery.of(context).size.height;
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   width: double.infinity,
          //   height: MediaQuery.of(context).size.height,
          //   // height: double.infinity,
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //   ),
          // ),
          CircleAvatar(
            maxRadius: 75,
            backgroundImage: NetworkImage(
              user.imageUrl ?? "",
            ),
          ),
          Row(
            children: [
              Text(
                "Followers ${user.followers.toString()}",
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                "Following ${user.following.toString()}",
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Text("Joined at ${user.joined_date.toString()}"),
        ],
      ),
    );
  }
}
