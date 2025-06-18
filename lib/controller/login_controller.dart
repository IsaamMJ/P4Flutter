import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/usecases/login_usecase.dart';

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

    final result = await loginUseCase(usernameController.text.trim(), passwordController.text.trim());

    isLoading.value = false;

    if (result.status == 'SUCCESS') {
      Get.snackbar('Success', result.message);
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
