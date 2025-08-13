import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController taxController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? taxError;
  String? usernameError;
  String? passwordError;

  void init(VoidCallback onChanged) {
    taxController.addListener(() {
      validateTax();
      onChanged();
    });
    usernameController.addListener(() {
      validateTax();
      onChanged();
    });
    passwordController.addListener(() {
      validateTax();
      onChanged();
    });
  }

  bool validateAll() {
    validateTax();
    validateUsername();
    validatePassword();
    return taxError == null && usernameError == null && passwordError == null;
  }

  void validateTax() {
    final value = taxController.text.trim();
    if (value.isEmpty) {
      taxError = "Mã số thuế không được để trống";
    } else if (value.length != 10) {
      taxError = "Mã số thuế phải có 10 số";
    } else {
      taxError = null;
    }
  }

  void validateUsername() {
    final value = usernameController.text.trim();
    if (value.isEmpty) {
      usernameError = "Tài khoản không được để trống";
    } else {
      usernameError = null;
    }
  }

  void validatePassword() {
    final value = passwordController.text.trim();
    if (value.isEmpty) {
      passwordError = "Mật khẩu không được để trống";
    } else if (value.length < 6 || value.length > 50) {
      passwordError = "Mật khẩu chỉ từ 6 đến 50 kí tự";
    } else {
      passwordError = null;
    }
  }

  bool checkLogin() {
    return taxController.text.trim() == "1111111111" &&
        usernameController.text.trim() == "demo" &&
        passwordController.text.trim() == "123456";
  }
}
