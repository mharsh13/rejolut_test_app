import 'package:flutter/material.dart';
import '/Models/UserModel.dart';

class UserProvider with ChangeNotifier {
  late UserModel user;

  void setUser(UserModel user) {
    this.user = user;
    notifyListeners();
  }
}
