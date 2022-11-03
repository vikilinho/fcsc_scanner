import 'dart:async';

import 'package:fcsc_admin/views/RevampPage/admin_page.dart';
import 'package:fcsc_admin/views/RevampPage/home.dart';
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
      Timer(Duration(milliseconds: 2000),
          () => Get.to(finalPass == null ? HomeScreen() : AdminPage()));
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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/Testmi.png"),
          ],
        ),
      )),
    );
  }
}
