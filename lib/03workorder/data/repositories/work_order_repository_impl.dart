// app/data/repositories/work_order_repository_impl.dart
import '../../domain/repositories/work_order_repository.dart';
import '../../domain/entities/work_order.dart';
import '../datasource/work_order_remote_data_source.dart';

class WorkOrderRepositoryImpl implements WorkOrderRepository {
  final WorkOrderRemoteDataSource remoteDataSource;

  WorkOrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<WorkOrder>> getWorkOrders() async {
    return await remoteDataSource.fetchWorkOrders();
  }
}
