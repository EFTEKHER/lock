import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/locker_controller.dart';
import '../controllers/notification_controller.dart';

class StudentDashboard extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final LockerController lockerController = Get.find<LockerController>();
  final NotificationController notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => authController.logout(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Student!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('View Lockers Status'),
                    onTap: () => Get.toNamed('/locker-status'),
                  ),
                  ListTile(
                    leading: Icon(Icons.book_online),
                    title: Text('Reserve a Locker'),
                    onTap: () => Get.toNamed('/reserve-locker'),
                  ),
                  ListTile(
                    leading: Icon(Icons.assignment),
                    title: Text('My Reservations'),
                    onTap: () => Get.toNamed('/my-reservations'),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                    onTap: () => Get.toNamed('/notifications'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
