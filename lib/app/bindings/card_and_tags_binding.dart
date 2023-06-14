import 'package:get/get.dart';
import 'package:star_shop/app/controller/cardAndTag_cart_controller.dart';

import '../controller/card_and_tag_controller.dart';

class CardAndTagsBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<CardAndTagsController>(() => CardAndTagsController());
    Get.lazyPut<CardAndTagCartController>(() => CardAndTagCartController());
  }

}