// presentation/bindings/notification_binding.dart
import 'package:get/get.dart';
import '../../controller/notification_controller.dart';
import '../../data/datasource/notification_remote_data_source.dart';
import '../../data/repositories/notification_repository_impl.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../domain/usecases/notification_usecase.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationRemoteDataSource());
    Get.lazyPut<NotificationRepository>(
            () => NotificationRepositoryImpl(Get.find()));
    Get.lazyPut(() => NotificationUseCase(Get.find()));
    Get.lazyPut(() => NotificationController(Get.find()));
  }
}
