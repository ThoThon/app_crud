import 'package:flutter/material.dart';

import '../../models/login/login_info.dart';
import '../../models/login/login_storage.dart';

class LoginController {
  final TextEditingController taxController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _storage = LoginStorage();
  bool _isLoggedIn = false; // trạng thái login trong memory

  void loadSavedLogin() {
    final stored = _storage.getLoginInfo();
    if (stored != null) {
      taxController.text = stored.taxCode;
      usernameController.text = stored.username;
      passwordController.text = stored.password;
    }
    _isLoggedIn = false;
  }

  bool login() {
    if (taxController.text.trim() == "1111111111" &&
        usernameController.text.trim() == "demo" &&
        passwordController.text.trim() == "123456") {
      final info = LoginInfo(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
        taxCode: taxController.text.trim(),
      );
      _storage.saveLoginInfo(info);
      _isLoggedIn = true;
      return true;
    }
    return false;
  }

  void logout() {
    _isLoggedIn = false; // chỉ đánh dấu logout
    // Không xóa dữ liệu trong Hive
  }

  bool get isLoggedIn => _isLoggedIn;

  void dispose() {
    taxController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
