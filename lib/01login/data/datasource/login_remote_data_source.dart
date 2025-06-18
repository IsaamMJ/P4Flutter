import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_response_model.dart';

class LoginRemoteDataSource {
  static const String _baseUrl = 'http://192.168.0.101:3000/api'; // Replace with your local IP

  Future<LoginResponseModel> login(String username, String password) async {
    final url = Uri.parse('$_baseUrl/01login');

    try {
      print('📤 Sending POST request to: $url');
      print('📦 Payload: {username: $username, password: $password}');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      print('🔁 RESPONSE STATUS: ${response.statusCode}');
      print('📝 RESPONSE BODY: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return LoginResponseModel.fromJson(data);
      } else {
        try {
          final error = jsonDecode(response.body);
          return LoginResponseModel(
            status: 'FAILED',
            message: error['message'] ?? 'Invalid credentials',
          );
        } catch (_) {
          return LoginResponseModel(
            status: 'FAILED',
            message: 'Unexpected error format',
          );
        }
      }
    } catch (e) {
      print('❌ NETWORK ERROR: $e');
      return LoginResponseModel(
        status: 'ERROR',
        message: 'Could not connect to server. Check your network or API status.',
      );
    }
  }
}
