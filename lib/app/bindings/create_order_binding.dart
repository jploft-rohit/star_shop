import 'package:get/get.dart';

import '../controller/create_order/canteen_menu_controller.dart';
import '../controller/create_order/create_order_controller.dart';
import '../controller/create_order/stationary_menu_controller.dart';
import '../controller/create_order/uniform_menu_controller.dart';

class CreateOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateOrderController>(() => CreateOrderController());
    Get.lazyPut<CanteenMenuController>(() => CanteenMenuController());
    Get.lazyPut<StationaryMenuController>(() => StationaryMenuController());
    Get.lazyPut<MenuUniformController>(() => MenuUniformController());
  }
}
