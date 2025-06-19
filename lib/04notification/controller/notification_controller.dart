// controller/notification_controller.dart
import 'package:get/get.dart';
import '../domain/entities/notification_item.dart';
import '../domain/usecases/notification_usecase.dart';

class NotificationController extends GetxController {
  final NotificationUseCase useCase;

  NotificationController(this.useCase);

  var notifications = <NotificationItem>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchNotifications() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await useCase.execute();
      notifications.assignAll(result);
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
