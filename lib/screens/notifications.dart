import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationsPage extends StatelessWidget {
  final NotificationController notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(
          () => notificationController.notifications.isEmpty
              ? Center(child: Text('No notifications available'))
              : ListView.builder(
                  itemCount: notificationController.notifications.length,
                  itemBuilder: (context, index) {
                    var notification = notificationController.notifications[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Icon(Icons.notifications, color: Colors.blue),
                        title: Text(notification['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(notification['message']!),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
