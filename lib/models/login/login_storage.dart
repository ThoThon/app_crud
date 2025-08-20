import 'package:hive/hive.dart';

import 'login_info.dart';

class LoginStorage {
  static const String boxName = 'loginBox';
  static const String keyUserLogin = 'user_login';

  Box<LoginInfo> get _box => Hive.box<LoginInfo>(boxName);

  /// Lưu thông tin đăng nhập
  Future<void> saveLoginInfo(LoginInfo info) async {
    await _box.put(keyUserLogin, info);
  }

  /// Lấy thông tin đăng nhập
  LoginInfo? getLoginInfo() {
    return _box.get(keyUserLogin);
  }

  /// Xóa thông tin đăng nhập
  Future<void> clearLoginInfo() async {
    await _box.delete(keyUserLogin);
  }

  /// Kiểm tra đã có dữ liệu login chưa
  bool hasLoginInfo() {
    final info = getLoginInfo();
    return info != null && info.username.isNotEmpty && info.password.isNotEmpty;
  }
}
