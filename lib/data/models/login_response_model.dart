import '../../domain/entities/login_result.dart';

class LoginResponseModel extends LoginResult {
  LoginResponseModel({required super.status, required super.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] ?? 'FAILED',
      message: json['message'] ?? '',
    );
  }
}
