// app/domain/usecases/work_order_usecase.dart
import '../entities/work_order.dart';
import '../repositories/work_order_repository.dart';

class WorkOrderUseCase {
  final WorkOrderRepository repository;

  WorkOrderUseCase(this.repository);

  Future<List<WorkOrder>> execute() {
    return repository.getWorkOrders();
  }
}
