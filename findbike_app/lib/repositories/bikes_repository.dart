import 'dart:convert';

import 'package:http/http.dart' as http;

class BikesRepository {
  Future<dynamic> bikes() async {
    final response = await http.get(Uri.parse('http://localhost:3000/bikes'));

    return jsonDecode(response.body);
  }

  Future<bool> update(int id) async {
    final response = await http.patch(
      Uri.parse('http://localhost:3000/bikes/$id'),
    );

    return response.statusCode == 200;
  }
}
