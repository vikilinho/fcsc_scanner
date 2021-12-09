import 'dart:async';

import 'package:fcsc_admin/views/home.dart';
import 'package:fcsc_admin/views/new_validationScreen.dart';
import 'package:fcsc_admin/views/validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

var finalPass;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // loadData();
    getMyTk().whenComplete(() async {
      Timer(
          Duration(milliseconds: 0),
          () => Get.off(
              finalPass == null ? HomeScreen() : NewValidationScreen()));
    });
    super.initState();
  }

  Future getMyTk() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenObtained = prefs.getString('pass');
    print(tokenObtained);
    setState(() {
      finalPass = tokenObtained;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromRGBO(28, 180, 174, 1),
        );
  }
}
