import 'package:app_crud/routes/app_pages.dart';
import 'package:app_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'models/login/login_info.dart';
import 'models/login/login_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(LoginInfoAdapter());
  await Hive.openBox<LoginInfo>('loginBox');

  final storage = LoginStorage();
  final stored = storage.getLoginInfo();
  final bool hasLogin = stored != null && stored.isLoggedIn;

  runApp(MyApp(initialRoute: hasLogin ? Routes.home : Routes.login));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
      initialRoute: initialRoute,
      routes: AppPages.routes,
    );
  }
}
