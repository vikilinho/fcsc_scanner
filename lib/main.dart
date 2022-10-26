import 'package:fcsc_admin/views/RevampPage/home.dart';
import 'package:fcsc_admin/views/splash.dart';
import 'package:fcsc_admin/views/user_card.dart';

import 'package:fcsc_admin/views/validation_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(builder: (context, child) {
      designSize:
      const Size(360, 640);

      minTextAdapt:
      true;

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp, // only allow portrait
      ]);
      {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme:
              ThemeData(primarySwatch: Colors.green, fontFamily: "MuseoSans"),
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
    });
  }
}
