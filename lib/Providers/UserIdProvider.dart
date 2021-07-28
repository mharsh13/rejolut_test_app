import 'package:flutter/material.dart';

class UserIdProvider with ChangeNotifier {
  late int userId;

  void setUserId(int userId) {
    this.userId = userId;
    notifyListeners();
  }
}
