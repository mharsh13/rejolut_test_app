import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Providers/AlbumIdProvider.dart';
import 'Providers/UserIdProvider.dart';
import 'Providers/UserProvider.dart';
import 'Screens/Auth/ui/LoginScreen.dart';
import 'Core/Theme/Theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserIdProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AlbumIdProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
