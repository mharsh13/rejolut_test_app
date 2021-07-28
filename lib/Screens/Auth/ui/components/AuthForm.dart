import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rejolut_test_app/Core/constants.dart';
import 'package:rejolut_test_app/Providers/UserIdProvider.dart';
import 'package:rejolut_test_app/Screens/Home/ui/HomeScreen.dart';

class AuthForm extends StatefulWidget {
  AuthForm({
    Key? key,
    required this.theme,
    required this.height,
    required this.width,
  }) : super(key: key);

  final ThemeData theme;
  final double height;
  final double width;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  static TextEditingController _emailController = TextEditingController();
  static TextEditingController _passwordController = TextEditingController();
  var userId;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _emailController,
              validator: (value) {
                if (!value!.endsWith("@rejolut.com") || value.length < 13) {
                  return "Enter a valid email address";
                } else {
                  return null;
                }
              },
              cursorColor: widget.theme.primaryColor,
              style: GoogleFonts.poppins(
                color: Colors.black54,
              ),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: widget.theme.primaryColor,
                ),
                labelText: "Email ID",
              ),
            ),
          ),
          SizedBox(
            height: widget.height * 0.03,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              validator: (value) {
                if (value!.length < 8) {
                  return "Password must be of minimum 8 characters";
                } else if (!emailValidatorRegExp.hasMatch(value)) {
                  return "Password must contain atleast 1 uppercase, 1 lowercase, 1 number and 1 special character";
                } else {
                  return null;
                }
              },
              controller: _passwordController,
              cursorColor: widget.theme.primaryColor,
              style: GoogleFonts.poppins(
                color: Colors.black54,
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                errorMaxLines: 2,
                icon: Icon(
                  Icons.lock,
                  color: widget.theme.primaryColor,
                ),
                labelText: "Password",
              ),
            ),
          ),
          SizedBox(
            height: widget.height * 0.1,
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                userId = (_emailController.text.substring(
                  0,
                  _emailController.text.indexOf("@"),
                )).length;
                Provider.of<UserIdProvider>(context, listen: false)
                    .setUserId(userId);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              }
            },
            child: Container(
              width: widget.width * 0.8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.theme.primaryColor,
                    widget.theme.accentColor,
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
            ),
          )
        ],
      ),
    );
  }
}
