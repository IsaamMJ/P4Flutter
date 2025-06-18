import '../../domain/entities/login_result.dart';

class LoginResponseModel extends LoginResult {
  LoginResponseModel({
    required String status,
    required String message,
    String? token,
  }) : super(status: status, message: message, token: token);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] ?? 'FAILED',
      message: json['message'] ?? '',
      token: json['token'], // Will be null if missing
    );
  }
}
