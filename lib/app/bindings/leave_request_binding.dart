import 'package:get/get.dart';

import '../controller/leave_request_controller.dart';

class LeaveRequestBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LeaveRequestController>(() => LeaveRequestController());
  }
  
}