// domain/entities/notification_item.dart
class NotificationItem {
  final String id;
  final String description;
  final String createdOn;
  final String priority;
  final String duration;
  final String type;

  NotificationItem({
    required this.id,
    required this.description,
    required this.createdOn,
    required this.priority,
    required this.duration,
    required this.type,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['Notification ID'] ?? '',
      description: json['Description'] ?? '',
      createdOn: json['Created On'] ?? '',
      priority: json['Priority'] ?? '',
      duration: json['Duration'] ?? '',
      type: json['Type'] ?? '',
    );
  }
}
