import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';
import '../domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter username and password');
      return;
    }

    isLoading.value = true;

    final result = await loginUseCase(
      usernameController.text.trim(),
      passwordController.text.trim(),
    );

    isLoading.value = false;

    if (result.status == 'SUCCESS' && result.token != null) {
      print('🔐 Token: ${result.token}');

      // ✅ Save token and username in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', result.token!);
      await prefs.setString('username', usernameController.text.trim());

      // ✅ Save token expiry (optional: 30 minutes from now)
      final expiry = DateTime.now()
          .add(const Duration(minutes: 30))
          .millisecondsSinceEpoch;
      await prefs.setInt('jwt_expiry', expiry);

      Get.snackbar('Success', result.message);
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar('Login Failed', result.message);
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
