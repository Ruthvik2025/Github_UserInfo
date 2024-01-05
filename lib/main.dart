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
        home: HomePage(),
      ),
    );
  }
}
