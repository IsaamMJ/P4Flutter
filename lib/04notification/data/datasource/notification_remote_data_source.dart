// data/datasource/notification_remote_data_source.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/notification_item.dart';

class NotificationRemoteDataSource {
  final String _apiUrl = 'http://localhost:3000/api/notification';

  Future<List<NotificationItem>> fetchNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? '';
    final token = prefs.getString('jwt_token') ?? '';

    if (username.isEmpty || token.isEmpty) {
      throw Exception('Missing username or token.');
    }

    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'username': username}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'SUCCESS') {
        return (data['data'] as List)
            .map((item) => NotificationItem.fromJson(item))
            .toList();
      } else {
        throw Exception(data['message'] ?? 'No notifications found.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
