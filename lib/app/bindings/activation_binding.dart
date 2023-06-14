import 'package:get/get.dart';

import '../controller/activation_controller.dart';

class ActivationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ActivationController>(() => ActivationController());
  }
  
}