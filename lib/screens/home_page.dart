import 'package:flutter/material.dart';
import 'package:github/screens/user_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _usernameController = TextEditingController();

  void submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UserDetails(
              userName: _usernameController.text,
            ))); //if it's not worked use _username.text
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("assets/git.png"),
                CircleAvatar(
                  maxRadius: 75,
                  backgroundImage: AssetImage("assets/git.png"),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty && value.length < 5) {
                          return "please submit something";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          hintText: "Enter your Github UserName ",
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  onPressed: () {
                    submit();
                  },
                  child: Text(
                    "Check",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
