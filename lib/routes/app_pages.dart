import 'package:get/get.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/bindings/login_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
