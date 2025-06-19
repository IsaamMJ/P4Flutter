// domain/usecases/notification_usecase.dart
import '../entities/notification_item.dart';
import '../repositories/notification_repository.dart';

class NotificationUseCase {
  final NotificationRepository repository;

  NotificationUseCase(this.repository);

  Future<List<NotificationItem>> execute() {
    return repository.getNotifications();
  }
}
