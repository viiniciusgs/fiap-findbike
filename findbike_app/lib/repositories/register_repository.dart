import 'package:findbike_app/models/register_dto.dart';
import 'package:http/http.dart' as http;

class RegisterRepository {
  Future<bool> register(RegisterDTO body) async {
    final response = await http.post(Uri.parse('http://localhost:3000/users'),
        body: body.toJson());

    return response.statusCode == 201;
  }
}
