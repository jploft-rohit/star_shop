import 'package:get/get.dart';
import 'package:star_shop/app/controller/current_orders_controller.dart';

class CurrentOrdersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CurrentOrdersController>(() => CurrentOrdersController());
  }

}