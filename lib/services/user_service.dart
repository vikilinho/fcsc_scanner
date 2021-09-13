import 'package:fcsc_admin/component/constants.dart';
import 'package:fcsc_admin/models/login.dart';
import 'package:fcsc_admin/views/validation_screen.dart';
import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetConnect {
  Future<Response> login(Login login) async {
    Response response = await post('$BASE_URL/Auth/Login', login.toJson());
    return response;
  }
  Future<Response> scanCard() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    Response response = await get('$BASE_URL/Candidates/ControlNo/$finalOutput', headers: headers);
    return response;
  }
}
