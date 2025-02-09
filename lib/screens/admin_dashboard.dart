import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class AdminDashboard extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
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
              'Welcome, Admin!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Manage Lockers'),
                    onTap: () => Get.toNamed('/manage-lockers'),
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text('Manage Users'),
                    onTap: () => Get.toNamed('/manage-users'),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Send Notifications'),
                    onTap: () => Get.toNamed('/send-notifications'),
                  ),
                  ListTile(
                    leading: Icon(Icons.report),
                    title: Text('Generate Reports'),
                    onTap: () => Get.toNamed('/generate-reports'),
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
