import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/locker_controller.dart';

class VisitorDashboard extends StatelessWidget {
  final LockerController lockerController = Get.find<LockerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visitor Dashboard')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Lockers',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: lockerController.lockers.length,
                    itemBuilder: (context, index) {
                      var locker = lockerController.lockers[index];
                      if (locker['status'] == 'Available') {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Icon(Icons.lock_open, color: Colors.green),
                            title: Text('Locker ${locker['id']}'),
                            subtitle: Text('Location: ${locker['location']}'),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  )),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/register'),
               
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                 child: Text('Sign Up to Reserve a Locker'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
