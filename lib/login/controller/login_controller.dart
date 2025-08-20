import 'package:flutter/material.dart';

import '../../models/login/login_info.dart';
import '../../models/login/login_storage.dart';

class LoginController {
  final TextEditingController taxController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loadSavedLogin() {
    final stored = LoginStorage.getLoginInfo();
    if (stored != null) {
      taxController.text = stored.taxCode;
      usernameController.text = stored.username;
      passwordController.text = stored.password;
    }
  }

  Future<bool> login() async {
    final tax = taxController.text.trim();
    final user = usernameController.text.trim();
    final pass = passwordController.text.trim();

    if (tax == "1111111111" && user == "demo" && pass == "123456") {
      final info = LoginInfo(
        username: user,
        password: pass,
        taxCode: tax,
      );
      await LoginStorage.saveLoginInfo(info);

      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await LoginStorage.clearLoginInfo();
  }

  void dispose() {
    taxController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
