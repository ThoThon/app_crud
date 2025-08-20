import 'package:hive/hive.dart';

import 'login_info.dart';

class LoginStorage {
  static const String boxName = 'loginBox';
  static const String keyUserLogin = 'user_login';

  static Box<LoginInfo> get _box => Hive.box<LoginInfo>(boxName);

  static Future<void> saveLoginInfo(LoginInfo info) async {
    await _box.put(keyUserLogin, info);
  }

  static LoginInfo? getLoginInfo() {
    return _box.get(keyUserLogin);
  }

  static Future<void> clearLoginInfo() async {
    await _box.delete(keyUserLogin);
  }

  static bool get isLoggedIn {
    final info = getLoginInfo();
    return info != null &&
        info.username.trim().isNotEmpty &&
        info.password.trim().isNotEmpty &&
        info.taxCode.trim().isNotEmpty;
  }
}
