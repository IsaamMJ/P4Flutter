import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF8B0000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Text(
                'Welcome to Maintenance Portal',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade500,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Row(
                children: [
                  // LEFT SECTION: Description
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Powerful Maintenance Management',
                            style: GoogleFonts.poppins(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Track, schedule, and optimize your maintenance tasks seamlessly.\nFast. Secure. Reliable.',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white70,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // RIGHT SECTION: Login Form
                  Expanded(
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                          child: Container(
                            width: 400,
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.red.shade800, width: 1.5),
                            ),
                            child: Obx(() {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade500,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  TextField(
                                    controller: controller.usernameController,
                                    style: GoogleFonts.poppins(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      labelStyle: GoogleFonts.poppins(color: Colors.red.shade200),
                                      filled: true,
                                      fillColor: Colors.white10,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red.shade400),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red.shade700, width: 2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  TextField(
                                    controller: controller.passwordController,
                                    obscureText: true,
                                    style: GoogleFonts.poppins(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: GoogleFonts.poppins(color: Colors.red.shade200),
                                      filled: true,
                                      fillColor: Colors.white10,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red.shade400),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red.shade700, width: 2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red.shade700,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: controller.isLoading.value ? null : controller.login,
                                      child: controller.isLoading.value
                                          ? const CircularProgressIndicator(color: Colors.white)
                                          : Text(
                                        'Login',
                                        style: GoogleFonts.poppins(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
