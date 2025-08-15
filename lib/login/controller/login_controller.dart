import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController taxController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool checkLogin() {
    return taxController.text.trim() == "1111111111" &&
        usernameController.text.trim() == "demo" &&
        passwordController.text.trim() == "123456";
  }

  void dispose() {
    taxController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
