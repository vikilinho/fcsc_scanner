import 'package:fcsc_admin/views/home.dart';
import 'package:fcsc_admin/views/splash.dart';
import 'package:fcsc_admin/views/user_card.dart';

import 'package:fcsc_admin/views/validation_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'locator.dart';
import 'views/new_validationScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
        '/validationScreen': (context) => ValidationScreen(),
        '/SplashScreen': (context) => SplashScreen(),
        '/NewValidationScreen': (context) => NewValidationScreen(),
        '/Usercard': (context) => UserCard(),
      },
      initialRoute: '/SplashScreen',
    );
  }
}
