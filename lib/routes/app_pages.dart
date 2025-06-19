import 'package:frontend/02dashboard/presentation/pages/dashboard_page.dart';
import 'package:get/get.dart';
import '../01login/presentation/bindings/login_binding.dart';
import '../01login/presentation/pages/login_page.dart';
import '../03workorder/presentation/pages/workorder_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.workorder,
      page: () => const WorkOrdersPage(),
      // binding: LoginBinding(),
    ),
  ];
}
