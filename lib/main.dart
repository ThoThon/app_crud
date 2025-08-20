import 'package:app_crud/services/hive_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/login/login_info.dart';
import 'models/login/login_storage.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveStorage.init();
  Hive.registerAdapter(LoginInfoAdapter());
  await HiveStorage.openBox<LoginInfo>(LoginStorage.boxName);

  final storage = LoginStorage();
  final bool hasLogin = storage.hasLoginInfo();

  runApp(MyApp(initialRoute: hasLogin ? Routes.home : Routes.login));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      routes: AppPages.routes,
    );
  }
}
