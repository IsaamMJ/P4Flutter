import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class WorkOrdersPage extends StatefulWidget {
  const WorkOrdersPage({Key? key}) : super(key: key);

  @override
  _WorkOrdersPageState createState() => _WorkOrdersPageState();
}

class _WorkOrdersPageState extends State<WorkOrdersPage> {
  List<dynamic> workOrders = [];
  bool isLoading = true;
  String mockUrl = "https://mocki.io/v1/01189645-c377-4692-9df4-0fe818dc5155"; // Replace with your actual mock URL

  late WorkOrderDataSource _workOrderDataSource;

  @override
  void initState() {
    super.initState();
    fetchWorkOrders();
  }

  // Function to fetch work orders from the mock URL
  Future<void> fetchWorkOrders() async {
    try {
      final response = await http.get(Uri.parse(mockUrl));
      if (response.statusCode == 200) {
        // Parse the response as a Map
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Access the 'data' key to get the list of work orders
        setState(() {
          workOrders = responseData['data'] ?? [];  // Use empty list if 'data' is not present
          isLoading = false;

          // Create data source with updated work orders
          _workOrderDataSource = WorkOrderDataSource(workOrders);
        });
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching data: $e");
    }
  }

  List<GridColumn> _buildColumns() {
    return [
      GridColumn(columnName: 'Order Number', label: Text('Order Number')),
      GridColumn(columnName: 'Order Type', label: Text('Order Type')),
      GridColumn(columnName: 'Order Description', label: Text('Order Description')),
      GridColumn(columnName: 'Created On', label: Text('Created On')),
      GridColumn(columnName: 'Created By', label: Text('Created By')),
      GridColumn(columnName: 'Last Changed By', label: Text('Last Changed By')),
      GridColumn(columnName: 'Company Code', label: Text('Company Code')),
      GridColumn(columnName: 'Plant', label: Text('Plant')),
      GridColumn(columnName: 'Object Number', label: Text('Object Number')),
      GridColumn(columnName: 'Routing Operation Number', label: Text('Routing Operation Number')),
      GridColumn(columnName: 'Basic Start Date', label: Text('Basic Start Date')),
      GridColumn(columnName: 'Basic Finish Date', label: Text('Basic Finish Date')),
      GridColumn(columnName: 'Activity Number', label: Text('Activity Number')),
      GridColumn(columnName: 'Operation Short Text', label: Text('Operation Short Text')),
      GridColumn(columnName: 'Work Centre', label: Text('Work Centre')),
      GridColumn(columnName: 'Employee ID', label: Text('Employee ID')),
      GridColumn(columnName: 'Notification Number', label: Text('Notification Number')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Orders'),
        backgroundColor: Colors.red.shade700,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SfDataGrid(
          source: _workOrderDataSource,
          columns: _buildColumns(),
          allowSorting: true,
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          selectionMode: SelectionMode.single,
          columnWidthMode: ColumnWidthMode.fill, // Automatically adjust column width
        ),
      ),
    );
  }
}

// DataSource for SfDataGrid
class WorkOrderDataSource extends DataGridSource {
  final List<dynamic> workOrders;

  WorkOrderDataSource(this.workOrders);

  @override
  List<DataGridRow> get rows {
    // Map the work orders into DataGridRow
    return workOrders.map<DataGridRow>((workOrder) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'Order Number', value: workOrder['Order Number']),
        DataGridCell(columnName: 'Order Type', value: workOrder['Order Type']),
        DataGridCell(columnName: 'Order Description', value: workOrder['Order Description']),
        DataGridCell(columnName: 'Created On', value: workOrder['Created On']),
        DataGridCell(columnName: 'Created By', value: workOrder['Created By']),
        DataGridCell(columnName: 'Last Changed By', value: workOrder['Last Changed By']),
        DataGridCell(columnName: 'Company Code', value: workOrder['Company Code']),
        DataGridCell(columnName: 'Plant', value: workOrder['Plant']),
        DataGridCell(columnName: 'Object Number', value: workOrder['Object Number']),
        DataGridCell(columnName: 'Routing Operation Number', value: workOrder['Routing Operation Number']),
        DataGridCell(columnName: 'Basic Start Date', value: workOrder['Basic Start Date']),
        DataGridCell(columnName: 'Basic Finish Date', value: workOrder['Basic Finish Date']),
        DataGridCell(columnName: 'Activity Number', value: workOrder['Activity Number']),
        DataGridCell(columnName: 'Operation Short Text', value: workOrder['Operation Short Text']),
        DataGridCell(columnName: 'Work Centre', value: workOrder['Work Centre']),
        DataGridCell(columnName: 'Employee ID', value: workOrder['Employee ID']),
        DataGridCell(columnName: 'Notification Number', value: workOrder['Notification Number']),
      ]);
    }).toList();
  }

  @override
  DataGridRowAdapter buildDataGridRowAdapter(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }

  // Implementation of the missing abstract buildRow method.
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
