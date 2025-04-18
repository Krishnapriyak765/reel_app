import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String email = '';
  String password = '';
  bool rememberMe = false;
  bool isPasswordVisible = false;

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  void toggleRememberMe(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
