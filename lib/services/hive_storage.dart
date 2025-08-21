import 'package:hive_flutter/hive_flutter.dart';

import '../models/login/login_info.dart';
import '../models/login/login_storage.dart';

class HiveStorage {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(LoginInfoAdapter());

    await Hive.openBox<LoginInfo>(LoginStorage.boxName);
  }
}
