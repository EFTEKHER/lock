import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/locker_controller.dart';

class MyReservationsPage extends StatelessWidget {
  final LockerController lockerController = Get.find<LockerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Reservations')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reserved Lockers',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: lockerController.lockers.length,
                    itemBuilder: (context, index) {
                      var locker = lockerController.lockers[index];
                      if (locker['status'] == 'Booked') {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Icon(Icons.lock, color: Colors.blue),
                            title: Text('Locker ${locker['id']}'),
                            subtitle: Text('Location: ${locker['location']}'),
                            trailing: ElevatedButton(
                              onPressed: () => lockerController.releaseLocker(locker['id']!),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              child: Text('Cancel'),
                            ),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
