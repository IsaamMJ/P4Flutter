// app/presentation/bindings/work_order_binding.dart
import 'package:get/get.dart';
import '../../controller/work_order_controller.dart';
import '../../data/repositories/work_order_repository_impl.dart'; // Import the repository interface
import '../../data/datasource/work_order_remote_data_source.dart';
import '../../domain/repositories/work_order_repository.dart';
import '../../domain/usecases/work_order_usecase.dart';

class WorkOrderBinding extends Bindings {
  @override
  void dependencies() {
    // Registering dependencies in the correct order
    Get.lazyPut<WorkOrderRemoteDataSource>(() => WorkOrderRemoteDataSource());
    Get.lazyPut<WorkOrderRepository>(() => WorkOrderRepositoryImpl(Get.find()));  // Register the interface and implementation
    Get.lazyPut<WorkOrderUseCase>(() => WorkOrderUseCase(Get.find()));
    Get.lazyPut<WorkOrderController>(() => WorkOrderController(Get.find()));
  }
}
