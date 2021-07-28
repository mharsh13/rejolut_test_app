import 'package:flutter/material.dart';
import 'package:rejolut_test_app/Screens/Auth/ui/LoginScreen.dart';
import 'Core/Theme/Theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rejolut',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: LoginScreen(),
    );
  }
}
