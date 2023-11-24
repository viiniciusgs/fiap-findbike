import 'package:http/http.dart' as http;

class LoginRepository {
  Future<bool> login(String email, String password) async {
    final response = await http.get(Uri.parse(
        'http://localhost:3000/users/email/$email?password=$password'));

    return response.statusCode == 200;
  }
}
