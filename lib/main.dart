import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Maintenance Portal',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login, // ✅ Entry route
      getPages: AppPages.routes,      // ✅ All route definitions
      unknownRoute: GetPage(          // ✅ Optional fallback
        name: '/not-found',
        page: () => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      ),
    );
  }
}
