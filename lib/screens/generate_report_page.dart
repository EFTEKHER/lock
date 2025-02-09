import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/locker_controller.dart';

class GenerateReportPage extends StatelessWidget {
  final LockerController lockerController = Get.find<LockerController>();

  Map<String, int> generateReportData() {
    int available = lockerController.lockers.where((locker) => locker['status'] == 'Available').length;
    int booked = lockerController.lockers.where((locker) => locker['status'] == 'Booked').length;
    int maintenance = lockerController.lockers.where((locker) => locker['status'] == 'Under Maintenance').length;
    return {
      'Available Lockers': available,
      'Booked Lockers': booked,
      'Under Maintenance': maintenance,
    };
  }

  @override
  Widget build(BuildContext context) {
    final reportData = generateReportData();
    return Scaffold(
      appBar: AppBar(title: Text('Generate Reports')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Locker Reports',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...reportData.entries.map((entry) => Card(
                  color: Colors.blue.shade100,
                  child: ListTile(
                    title: Text(entry.key),
                    trailing: Text(
                      entry.value.toString(),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              child: Text('Export Report'),
            ),
          ],
        ),
      ),
    );
  }
}
