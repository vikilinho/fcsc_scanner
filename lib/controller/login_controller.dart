import 'dart:developer';

import 'package:fcsc_admin/locator.dart';
import 'package:fcsc_admin/models/login.dart';
import 'package:fcsc_admin/services/user_service.dart';
import 'package:fcsc_admin/views/RevampPage/admin_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  void togglePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;
  void login(Login login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    Response response = await locator<UserService>()
        .login(login)
        .timeout(Duration(seconds: 300));
    isLoading.value = false;
    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> map = response.body;

        var token = map['objectValue']['token'];
        log(token.toString());

        prefs.setString('pass', token);

        Get.off(() => AdminPage());
        break;
      case 400:
        print(response.statusCode);
        Get.snackbar('Error!', "Invalid Credentials",
            colorText: Colors.white, backgroundColor: Colors.pinkAccent);
    }
  }
}
