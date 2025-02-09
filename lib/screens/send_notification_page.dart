import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class SendNotificationPage extends StatelessWidget {
  final NotificationController notificationController = Get.find<NotificationController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void sendNotification() {
    String title = titleController.text.trim();
    String message = messageController.text.trim();

    if (title.isEmpty || message.isEmpty) {
      Get.snackbar("Error", "Title and Message cannot be empty!", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    notificationController.addNotification(title, message);
    Get.snackbar("Success", "Notification Sent!", snackPosition: SnackPosition.BOTTOM);
    titleController.clear();
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Send Notification")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: messageController,
              decoration: InputDecoration(labelText: "Message", border: OutlineInputBorder()),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendNotification,
              
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              child: Text("Send Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
