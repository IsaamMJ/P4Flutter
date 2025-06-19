// domain/repositories/notification_repository.dart
import '../entities/notification_item.dart';

abstract class NotificationRepository {
  Future<List<NotificationItem>> getNotifications();
}
