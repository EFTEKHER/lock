import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/locker_controller.dart';

class ManageLockersPage extends StatelessWidget {
  final LockerController lockerController = Get.find<LockerController>();

  void _addLockerDialog(BuildContext context) {
    TextEditingController lockerIdController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    RxString status = 'Available'.obs;

    Get.defaultDialog(
      title: "Add New Locker",
      content: Column(
        children: [
          TextField(
            controller: lockerIdController,
            decoration: InputDecoration(labelText: "Locker ID"),
          ),
          SizedBox(height: 10),
          TextField(
            controller: locationController,
            decoration: InputDecoration(labelText: "Location"),
          ),
          SizedBox(height: 10),
          Obx(() => DropdownButton<String>(
                value: status.value,
                items: ['Available', 'Booked', 'Under Maintenance']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  status.value = value!;
                },
              )),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (lockerIdController.text.isNotEmpty && locationController.text.isNotEmpty) {
                lockerController.addLocker(lockerIdController.text.trim(), status.value, locationController.text.trim());
                Get.back(closeOverlays: true);
              }
            },
            child: Text("Add Locker"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Lockers')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addLockerDialog(context),
        child: Icon(Icons.add),
      ),
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
                  title: Text('Locker ID: ${locker['id']}'),
                  subtitle: Text('Status: ${locker['status']}\nLocation: ${locker['location']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => lockerController.updateLockerStatus(locker['id']!, 'Available'),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => lockerController.deleteLocker(locker['id']!),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
