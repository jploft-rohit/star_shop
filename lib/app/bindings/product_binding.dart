import 'package:get/get.dart';
import 'package:star_shop/app/controller/product_canteen_controller.dart';
import 'package:star_shop/app/controller/product_controller.dart';
import 'package:star_shop/app/controller/product_star_store_controller.dart';
import 'package:star_shop/app/controller/product_stationary_controller.dart';
import 'package:star_shop/app/controller/product_uniform_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<ProductCanteenController>(() => ProductCanteenController());
    Get.lazyPut<ProductStationaryController>(() => ProductStationaryController());
    Get.lazyPut<ProductUniformController>(() => ProductUniformController());
    Get.lazyPut<ProductStarStoreController>(() => ProductStarStoreController());
  }
}
