import 'package:flutter/material.dart';

import '../../models/login/login_info.dart';
import '../../models/login/login_storage.dart';

class LoginController {
  final TextEditingController taxController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _storage = LoginStorage();

  void loadSavedLogin() {
    final stored = _storage.getLoginInfo();
    if (stored != null) {
      taxController.text = stored.taxCode ?? '';
      usernameController.text = stored.username ?? '';
      passwordController.text = stored.password ?? '';
    }
  }

  bool checkLogin() {
    if (taxController.text.trim() == "1111111111" &&
        usernameController.text.trim() == "demo" &&
        passwordController.text.trim() == "123456") {
      _storage.saveLoginInfo(LoginInfo(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
        taxCode: taxController.text.trim(),
        isLoggedIn: true,
      ));
      return true;
    }
    return false;
  }

  void dispose() {
    taxController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
