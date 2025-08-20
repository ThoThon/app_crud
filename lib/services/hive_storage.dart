import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  static Future<Box<T>> openBox<T>(String name) async {
    return await Hive.openBox<T>(name);
  }

  static Box<T> getBox<T>(String name) {
    return Hive.box<T>(name);
  }
}
