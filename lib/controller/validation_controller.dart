import 'package:fcsc_admin/component/constants.dart';
import 'package:http/http.dart' as http;

var endpoint = Uri.parse('$BASE_URL/Candidates/ControlNo/');

class ValidationController {
  final Uri url;

  ValidationController(this.url);
  Future<http.Response> get() {
    return http.get(endpoint).timeout(Duration(minutes: 2));
  }
}
