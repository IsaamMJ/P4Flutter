// app/domain/repositories/work_order_repository.dart
import '../entities/work_order.dart';

abstract class WorkOrderRepository {
  Future<List<WorkOrder>> getWorkOrders();
}
