import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejolut_test_app/Core/Theme/constants.dart';

ThemeData buildThemeData() {
  return ThemeData(
    primaryColor: kprimary,
    accentColor: kaccent,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.poppins(
        color: kaccent,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: kprimary,
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: kprimary,
        ),
        gapPadding: 10,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: kprimary,
        ),
        gapPadding: 10,
      ),
    ),
  );
}
