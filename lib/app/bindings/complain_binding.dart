import 'package:get/get.dart';

import '../controller/complain_controller.dart';
import '../controller/raise_complain_controller.dart';


class ComplainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ComplainController>(() => ComplainController());
    Get.lazyPut<RaiseComplainController>(() => RaiseComplainController());
  }
  
}