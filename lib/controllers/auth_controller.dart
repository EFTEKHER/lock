import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var userRole = ''.obs;
  var users = <Map<String, String>>[
    {'email': 'admin@gmail.com', 'password': '123456', 'role': 'admin'},
    {'email': 'student@gmail.com', 'password': '123456', 'role': 'student'}
  ].obs; // Stores registered users

  void login(String email, String password) {
    var user = users.firstWhereOrNull((u) => u['email'] == email && u['password'] == password);
    if (user != null) {
      userRole.value = user['role']!;
      isLoggedIn.value = true;
      Get.offNamed(user['role'] == 'admin' ? '/admin-dashboard' : '/student-dashboard');
    } else {
      Get.snackbar('Login Failed', 'Invalid credentials', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void register(String email, String password, String role) {
    users.add({'email': email, 'password': password, 'role': role});
    Get.snackbar('Registration Successful', 'You can now login', snackPosition: SnackPosition.BOTTOM);
    Get.offNamed('/login');
  }

  void logout() {
    isLoggedIn.value = false;
    userRole.value = '';
    Get.offAllNamed('/login');
  }
}
