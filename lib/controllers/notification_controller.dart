import 'package:get/get.dart';

class NotificationController extends GetxController {
  var notifications = <Map<String, String>>[
    {'title': 'Locker Reserved', 'message': 'You have successfully reserved Locker L1.'},
    {'title': 'Locker Expiry Reminder', 'message': 'Your Locker L3 expires on Jan 15, 2025.'},
    {'title': 'System Update', 'message': 'Locker maintenance scheduled for next week.'},
  ].obs;

  void addNotification(String title, String message) {
    notifications.insert(0, {'title': title, 'message': message});
    update();
  }
}
