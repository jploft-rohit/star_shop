import 'package:get/get.dart';
import 'package:star_shop/app/controller/awareness_controller.dart';

class AwarenessBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AwarenessController>(() => AwarenessController());
  }
  
}