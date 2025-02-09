import 'package:get/get.dart';
import '../screens/login_page.dart';
import '../screens/registration_page.dart';
import '../screens/splash_screen.dart';
import '../screens/admin_dashboard.dart';
import '../screens/student_dashboard.dart';
import '../screens/visitor_dashboard.dart';
import '../screens/manage_users_page.dart';
import '../screens/manage_lockers_page.dart';
import '../screens/reserve_locker.dart';
import '../screens/my_reservations.dart';
import '../screens/notifications.dart';
import '../screens/send_notification_page.dart';
import '../screens/generate_report_page.dart';
import  '../screens/locker_status.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/register', page: () => RegistrationPage()),
    GetPage(name: '/admin-dashboard', page: () => AdminDashboard()),
    GetPage(name: '/student-dashboard', page: () => StudentDashboard()),
    GetPage(name: '//locker-status', page: () => LockerStatusPage()),
    GetPage(name: '/visitor-dashboard', page: () => VisitorDashboard()),
    GetPage(name: '/manage-users', page: () => ManageUsersPage()),
    GetPage(name: '/manage-lockers', page: () => ManageLockersPage()),
    GetPage(name: '/reserve-locker', page: () => ReserveLockerPage()),
    GetPage(name: '/my-reservations', page: () => MyReservationsPage()),
    GetPage(name: '/notifications', page: () => NotificationsPage()),
    GetPage(name: '/send-notifications', page: () => SendNotificationPage()),
    GetPage(name: '/generate-reports', page: () => GenerateReportPage()),
  ];
}
