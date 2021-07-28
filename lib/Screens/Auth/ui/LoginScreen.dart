import 'package:flutter/material.dart';
import 'components/AuthForm.dart';
import 'components/Header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(height: height),
                SizedBox(
                  height: height * 0.1,
                ),
                AuthForm(theme: theme, height: height, width: width)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
