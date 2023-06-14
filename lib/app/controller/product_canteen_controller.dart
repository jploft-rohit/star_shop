import 'package:get/get.dart';
import 'package:star_shop/app/controller/product_controller.dart';

class ProductCanteenController extends GetxController {

  final selectedCanteenPos = 0.obs;
  final canteenCategoryList = ['Requested', 'Approved','Menu'];

  ProductCanteenController(){
    selectedCanteenPos.value = Get.find<ProductController>().initialIndex;
  }

}