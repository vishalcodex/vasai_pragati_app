import 'package:get/get.dart';
import '../controllers/locker_controller.dart';

class LockerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LockerController());
  }
}
