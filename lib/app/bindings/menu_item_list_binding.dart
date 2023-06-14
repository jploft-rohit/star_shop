import 'package:get/get.dart';
import 'package:star_shop/app/controller/menu_item_list_controller.dart';

class MenuItemListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MenuItemListController>(() => MenuItemListController());
  }
  
}