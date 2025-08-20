import 'package:hive/hive.dart';

part 'login_info.g.dart';

@HiveType(typeId: 0)
class LoginInfo {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final String password;

  @HiveField(2)
  final String taxCode;

  LoginInfo({
    required this.username,
    required this.password,
    required this.taxCode,
  });
}
