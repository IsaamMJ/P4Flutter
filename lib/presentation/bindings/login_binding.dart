import 'package:get/get.dart';
import '../../controller/login_controller.dart';
import '../../data/datasource/login_remote_data_source.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../domain/repositories/login_repository.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRemoteDataSource>(() => LoginRemoteDataSource());
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(Get.find())); // ✅ FIXED
    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));

  }
}
