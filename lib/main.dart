import 'package:app_crud/services/hive_storage.dart';
import 'package:flutter/material.dart';

import 'models/login/login_storage.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveStorage.init();

  final bool hasLogin = LoginStorage.isLoggedIn;

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
