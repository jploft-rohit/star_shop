import 'package:get/get.dart';
import 'package:star_shop/app/controller/out_of_stock_controller.dart';

class OutOfStockBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OutOfStockItemController>(() => OutOfStockItemController());
  }
  
}