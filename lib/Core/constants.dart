import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final Color kprimary = HexColor("#f4325c");
final Color kaccent = HexColor("#fb8c66");
final RegExp emailValidatorRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
const api = "https://jsonplaceholder.typicode.com/";
