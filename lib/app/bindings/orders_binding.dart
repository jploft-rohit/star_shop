import 'package:get/get.dart';
import 'package:star_shop/app/controller/orders/order_canteen_controller.dart';
import 'package:star_shop/app/controller/orders/order_star_store_controller.dart';
import 'package:star_shop/app/controller/orders/order_uniform_controller.dart';
import 'package:star_shop/app/controller/orders/orders_controller.dart';

import '../controller/orders/order_stationary_controller.dart';

class OrdersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(() => OrdersController());
    Get.lazyPut<OrderCanteenController>(() => OrderCanteenController());
    Get.lazyPut<OrderStationaryController>(() => OrderStationaryController());
    Get.lazyPut<OrderUniformController>(() => OrderUniformController());
    Get.lazyPut<OrderStarStoreController>(() => OrderStarStoreController());
  }
  
}