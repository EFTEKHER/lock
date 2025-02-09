import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/locker_controller.dart';

class LockerStatusPage extends StatelessWidget {
  final LockerController lockerController = Get.find<LockerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Locker Status')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(
          () => ListView.builder(
            itemCount: lockerController.lockers.length,
            itemBuilder: (context, index) {
              var locker = lockerController.lockers[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Icon(
                    locker['status'] == 'Booked'
                        ? Icons.lock
                        : locker['status'] == 'Available'
                            ? Icons.lock_open
                            : Icons.build,
                    color: locker['status'] == 'Booked'
                        ? Colors.red
                        : locker['status'] == 'Available'
                            ? Colors.green
                            : Colors.orange,
                  ),
                  title: Text('Locker ${locker['id']}'),
                  subtitle: Text('Status: ${locker['status']}\nLocation: ${locker['location']}'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
