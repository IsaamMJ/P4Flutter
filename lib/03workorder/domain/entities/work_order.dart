// app/domain/entities/work_order.dart
class WorkOrder {
  final String orderNumber;
  final String orderType;
  final String orderDescription;
  final String createdOn;
  final String createdBy;
  final String lastChangedBy;
  final String companyCode;
  final String plant;
  final String objectNo;
  final String routingOperationNumber;
  final String basicStartDate;
  final String basicFinishDate;
  final String activityNumber;
  final String operationShortText;
  final String workCentre;
  final String employeeId;
  final String notificationNumber;

  WorkOrder({
    required this.orderNumber,
    required this.orderType,
    required this.orderDescription,
    required this.createdOn,
    required this.createdBy,
    required this.lastChangedBy,
    required this.companyCode,
    required this.plant,
    required this.objectNo,
    required this.routingOperationNumber,
    required this.basicStartDate,
    required this.basicFinishDate,
    required this.activityNumber,
    required this.operationShortText,
    required this.workCentre,
    required this.employeeId,
    required this.notificationNumber,
  });

  // Factory method to create WorkOrder from JSON
  factory WorkOrder.fromJson(Map<String, dynamic> json) {
    return WorkOrder(
      orderNumber: json['Order Number'],
      orderType: json['Order Type'],
      orderDescription: json['Order Description'],
      createdOn: json['Created On'],
      createdBy: json['Created By'],
      lastChangedBy: json['Last Changed By'],
      companyCode: json['Company Code'],
      plant: json['Plant'],
      objectNo: json['Object Number'],
      routingOperationNumber: json['Routing Operation Number'],
      basicStartDate: json['Basic Start Date'],
      basicFinishDate: json['Basic Finish Date'],
      activityNumber: json['Activity Number'],
      operationShortText: json['Operation Short Text'],
      workCentre: json['Work Centre'],
      employeeId: json['Employee ID'],
      notificationNumber: json['Notification Number'],
    );
  }
}
