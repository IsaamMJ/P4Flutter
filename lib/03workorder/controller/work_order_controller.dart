import 'package:get/get.dart';
import '../domain/entities/work_order.dart';
import '../domain/usecases/work_order_usecase.dart';

class WorkOrderController extends GetxController {
  final WorkOrderUseCase workOrderUseCase;

  var workOrders = <WorkOrder>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  WorkOrderController(this.workOrderUseCase);

  Future<void> fetchWorkOrders() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await workOrderUseCase.execute();

      // Optionally format SAP-style dates here before passing to UI
      final formattedResult = result.map((wo) {
        return WorkOrder(
          orderNumber: wo.orderNumber,
          orderType: wo.orderType,
          orderDescription: wo.orderDescription,
          createdOn: formatSAPDate(wo.createdOn),
          createdBy: wo.createdBy,
          lastChangedBy: wo.lastChangedBy,
          companyCode: wo.companyCode,
          plant: wo.plant,
          objectNo: wo.objectNo,
          routingOperationNumber: wo.routingOperationNumber,
          basicStartDate: formatSAPDate(wo.basicStartDate),
          basicFinishDate: formatSAPDate(wo.basicFinishDate),
          activityNumber: wo.activityNumber,
          operationShortText: wo.operationShortText,
          workCentre: wo.workCentre,
          employeeId: wo.employeeId,
          notificationNumber: wo.notificationNumber,
        );
      }).toList();

      workOrders.value = formattedResult;
    } catch (e) {
      errorMessage.value = 'Failed to load work orders: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Helper to convert /Date(XXXXXXXXXX)/ to dd/MM/yyyy
  String formatSAPDate(dynamic value) {
    final regex = RegExp(r'\/Date\((\d+)\)\/');
    final match = regex.firstMatch(value.toString());
    if (match != null) {
      final millis = int.parse(match.group(1)!);
      final date = DateTime.fromMillisecondsSinceEpoch(millis);
      return "${date.day.toString().padLeft(2, '0')}/"
          "${date.month.toString().padLeft(2, '0')}/"
          "${date.year}";
    }
    return value.toString();
  }
}
