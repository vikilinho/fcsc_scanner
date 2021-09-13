import 'package:fcsc_admin/locator.dart';
import 'package:fcsc_admin/models/login.dart';
import 'package:fcsc_admin/services/user_service.dart';
import 'package:fcsc_admin/views/home.dart';
import 'package:fcsc_admin/views/validation_screen.dart';
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
        Get.snackbar('Login', "Login Successful");
       Get.to(ValidationScreen());
        break;
      case 400:
        print(response.statusCode);
        Get.snackbar('Login', "Invalid Credentials");
    }
  }
}
