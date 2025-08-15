import 'package:hive/hive.dart';

part 'login_info.g.dart';

@HiveType(typeId: 0)
class LoginInfo {
  @HiveField(0)
  String? username;

  @HiveField(1)
  String? password;

  @HiveField(2)
  String? taxCode;

  @HiveField(3)
  bool isLoggedIn;

  LoginInfo({
    required this.username,
    required this.password,
    required this.taxCode,
    this.isLoggedIn = false,
  });
}
