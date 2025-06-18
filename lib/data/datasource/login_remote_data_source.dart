import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_response_model.dart';

class LoginRemoteDataSource {
  static const String _baseUrl = 'http://localhost:3000/api';
  // static const String _baseUrl = 'https://92e8c554-a9c6-48d5-a7b3-d6883a1452cf.mock.pstmn.io';


  Future<LoginResponseModel> login(String username, String password) async {
    final url = Uri.parse('$_baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return LoginResponseModel.fromJson(data);
      } else {
        return LoginResponseModel(status: 'FAILED', message: 'Invalid credentials');
      }
    } catch (_) {
      return LoginResponseModel(status: 'ERROR', message: 'Something went wrong');
    }
  }
}
