import 'package:get/get.dart';

class UserController extends GetxController {
  var users = <Map<String, String>>[
    {'id': 'U1', 'email': 'student1@example.com', 'role': 'Student'},
    {'id': 'U2', 'email': 'student2@example.com', 'role': 'Student'},
    {'id': 'U3', 'email': 'visitor1@example.com', 'role': 'Visitor'},
  ].obs;

  void removeUser(String userId) {
    users.removeWhere((user) => user['id'] == userId);
    update();
    Get.snackbar('User Removed', 'User $userId has been removed.', snackPosition: SnackPosition.BOTTOM);
  }
}
