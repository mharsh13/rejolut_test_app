import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    Key? key,
    required this.theme,
    required this.height,
    required this.width,
  }) : super(key: key);

  final ThemeData theme;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            cursorColor: theme.primaryColor,
            style: GoogleFonts.poppins(
              color: Colors.black54,
            ),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: theme.primaryColor,
              ),
              labelText: "Email ID",
            ),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            cursorColor: theme.primaryColor,
            style: GoogleFonts.poppins(
              color: Colors.black54,
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: theme.primaryColor,
              ),
              labelText: "Password",
            ),
          ),
        ),
        SizedBox(
          height: height * 0.1,
        ),
        Container(
          width: width * 0.8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.primaryColor,
                theme.accentColor,
              ],
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Login",
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
