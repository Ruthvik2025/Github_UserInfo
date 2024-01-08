import 'package:flutter/material.dart';
import 'package:github/provider/user_provider.dart';
import 'package:github/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserProvider(),
      child: MaterialApp(
        title: "github API",
        theme: ThemeData(
          primaryColor: Colors.blue,
          // accentColor: Colors.blueAccent,
          textTheme: TextTheme(
            caption: TextStyle(
              fontSize: 14.0,
              height: 1.5,
              color: Colors.white10,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
