import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/work_order.dart';

class WorkOrderRemoteDataSource {
  final String _apiUrl = 'http://localhost:3000/api/work-orders';

  Future<List<WorkOrder>> fetchWorkOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? '';
    final token = prefs.getString('jwt_token') ?? '';

    if (username.isEmpty || token.isEmpty) {
      throw Exception('Missing username or token in local storage.');
    }

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'username': username}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        if (data['status'] == 'SUCCESS') {
          final workOrders = data['data'] as List<dynamic>;

          return workOrders
              .map((json) => WorkOrder.fromJson(json as Map<String, dynamic>))
              .toList();
        } else {
          throw Exception(data['message'] ?? 'No work orders returned from server.');
        }
      } else {
        throw Exception('Server error: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Network or parsing error: $e');
    }
  }
}
