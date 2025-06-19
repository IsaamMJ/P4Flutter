import 'package:frontend/02dashboard/presentation/pages/dashboard_page.dart';
import 'package:get/get.dart';
import '../01login/presentation/bindings/login_binding.dart';
import '../01login/presentation/pages/login_page.dart';
import '../03workorder/presentation/bindings/work_order_binding.dart';
import '../03workorder/presentation/pages/work_order_page.dart';
import '../04notification/presentation/bindings/notification_binding.dart';
import '../04notification/presentation/pages/notification_page.dart';
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
      page: () => WorkOrderPage(),
      binding: WorkOrderBinding(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
    ),
  ];
}
