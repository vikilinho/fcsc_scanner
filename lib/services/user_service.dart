import 'package:fcsc_admin/component/constants.dart';
import 'package:fcsc_admin/models/login.dart';
import 'package:get/get_connect.dart';

class UserService extends GetConnect {
  Future<Response> login(Login login) async {
    Response response = await post('$BASE_URL/Auth/Login', login.toJson());
    return response;
  }
}
