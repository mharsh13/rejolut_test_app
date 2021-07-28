import 'package:flutter/material.dart';
import 'package:rejolut_test_app/Models/UserModel.dart';

class UserProvider with ChangeNotifier {
  late UserModel user;

  void setUser(UserModel user) {
    this.user = user;
    notifyListeners();
  }
}
