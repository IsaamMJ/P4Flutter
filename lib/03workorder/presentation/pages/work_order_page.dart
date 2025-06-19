import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_routes.dart';
import '../../controller/work_order_controller.dart';

class WorkOrderPage extends StatelessWidget {
  const WorkOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WorkOrderController>();

    // Fetch data on first frame if not already loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.workOrders.isEmpty && !controller.isLoading.value) {
        controller.fetchWorkOrders();
      }
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1C1C1E), Color(0xFF8B0000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _HeaderSection(),
                const SizedBox(height: 20),
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(
                          child: CircularProgressIndicator(color: Colors.redAccent));
                    }

                    if (controller.errorMessage.isNotEmpty) {
                      return Center(
                        child: Text(
                          controller.errorMessage.value,
                          style: GoogleFonts.poppins(color: Colors.redAccent),
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.65),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.red.shade800, width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: DataTable(
                          headingRowColor:
                          MaterialStateProperty.all(const Color(0xFF8B0000)),
                          headingTextStyle: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          dataTextStyle: GoogleFonts.poppins(color: Colors.white),
                          columns: const [
                            DataColumn(label: Text('Order Number')),
                            DataColumn(label: Text('Order Type')),
                            DataColumn(label: Text('Order Description')),
                            DataColumn(label: Text('Created On')),
                            DataColumn(label: Text('Created By')),
                            DataColumn(label: Text('Last Changed By')),
                            DataColumn(label: Text('Company Code')),
                            DataColumn(label: Text('Plant')),
                            DataColumn(label: Text('Work Centre')),
                            DataColumn(label: Text('Notification Number')),
                          ],
                          rows: controller.workOrders.map((workOrder) {
                            return DataRow(cells: [
                              DataCell(Text(workOrder.orderNumber)),
                              DataCell(Text(workOrder.orderType)),
                              DataCell(Text(workOrder.orderDescription)),
                              DataCell(Text(workOrder.createdOn)),
                              DataCell(Text(workOrder.createdBy)),
                              DataCell(Text(workOrder.lastChangedBy)),
                              DataCell(Text(workOrder.companyCode)),
                              DataCell(Text(workOrder.plant)),
                              DataCell(Text(workOrder.workCentre)),
                              DataCell(Text(workOrder.notificationNumber)),
                            ]);
                          }).toList(),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Reusable header with Logout button
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  Future<void> _handleLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
    await prefs.remove('jwt_expiry');
    await prefs.remove('username');
    Get.offAllNamed(AppRoutes.login);
  }

  void _navigateToDashboard() {
    Get.offAllNamed(AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Work Order Data',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.red.shade400,
          ),
        ),
        Wrap(
          spacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: _navigateToDashboard,
              icon: const Icon(Icons.dashboard),
              label: const Text("Dashboard"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _handleLogout,
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

