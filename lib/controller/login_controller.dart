import 'package:fcsc_admin/locator.dart';
import 'package:fcsc_admin/models/login.dart';
import 'package:fcsc_admin/services/user_service.dart';
import 'package:fcsc_admin/views/new_validationScreen.dart';

import 'package:fcsc_admin/views/validation_screen.dart';
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
    Response response = await locator<UserService>().login(login);
    isLoading.value = false;
    switch (response.statusCode) {
      case 200:
        var resp = response.body["objectValue"];
        prefs.setString('pass', resp['token']);
        Get.snackbar("Login Successful", "",
            duration: Duration(seconds: 5),
            colorText: Colors.white,
            backgroundColor: Colors.green);
        Get.to(NewValidationScreen());
        break;
      case 400:
        print(response.statusCode);
        Get.snackbar('Error!', "Invalid Credentials",
            colorText: Colors.white, backgroundColor: Colors.pinkAccent);
    }
  }
}
