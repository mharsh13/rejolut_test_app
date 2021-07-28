import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.15,
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Welcome,",
            style: GoogleFonts.montserrat(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Sign in to Continue!",
            style: GoogleFonts.montserrat(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}
