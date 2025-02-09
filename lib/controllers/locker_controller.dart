import 'package:get/get.dart';

class LockerController extends GetxController {
  var lockers = <Map<String, String>>[
    {'id': 'L1', 'status': 'Available', 'location': 'Hall A'},
    {'id': 'L2', 'status': 'Booked', 'location': 'Hall B'},
    {'id': 'L3', 'status': 'Under Maintenance', 'location': 'Hall C'},
    {'id': 'L4', 'status': 'Available', 'location': 'Hall D'},
    {'id': 'L5', 'status': 'Booked', 'location': 'Hall E'},
    {'id': 'L6', 'status': 'Available', 'location': 'Hall F'},
    {'id': 'L7', 'status': 'Available', 'location': 'Hall G'},
    {'id': 'L8', 'status': 'Booked', 'location': 'Hall H'},
    {'id': 'L9', 'status': 'Under Maintenance', 'location': 'Hall I'},
    {'id': 'L10', 'status': 'Available', 'location': 'Hall J'},
    {'id': 'L11', 'status': 'Booked', 'location': 'Hall K'},
    {'id': 'L12', 'status': 'Available', 'location': 'Hall L'},
  ].obs;

  void reserveLocker(String lockerId) {
    int index = lockers.indexWhere((locker) => locker['id'] == lockerId);
    if (index != -1 && lockers[index]['status'] == 'Available') {
      lockers[index]['status'] = 'Booked';
      update();
      Get.snackbar('Success', 'Locker $lockerId reserved!', snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Locker $lockerId is not available!', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void releaseLocker(String lockerId) {
    int index = lockers.indexWhere((locker) => locker['id'] == lockerId);
    if (index != -1 && lockers[index]['status'] == 'Booked') {
      lockers[index]['status'] = 'Available';
      update();
      Get.snackbar('Success', 'Locker $lockerId released!', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void updateLockerStatus(String lockerId, String newStatus) {
    int index = lockers.indexWhere((locker) => locker['id'] == lockerId);
    if (index != -1) {
      lockers[index]['status'] = newStatus;
      update();
      Get.snackbar('Success', 'Locker $lockerId status updated!', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void addLocker(String lockerId, String status, String location) {
    lockers.add({'id': lockerId, 'status': status, 'location': location});
    update();
    Get.snackbar('Success', 'Locker $lockerId added!', snackPosition: SnackPosition.BOTTOM);
  }

  void deleteLocker(String lockerId) {
    lockers.removeWhere((locker) => locker['id'] == lockerId);
    update();
    Get.snackbar('Success', 'Locker $lockerId deleted!', snackPosition: SnackPosition.BOTTOM);
  }
}
