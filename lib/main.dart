import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'screens/splash_screen.dart';
import 'controllers/auth_controller.dart';
import 'controllers/locker_controller.dart';
import 'controllers/notification_controller.dart';
import 'controllers/user_controller.dart';

void main() {
  Get.put(AuthController());
  Get.put(LockerController());
  Get.put(NotificationController());
  Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Locker Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: AppRoutes.routes,
      home: SplashScreen(),
    );
  }
}
