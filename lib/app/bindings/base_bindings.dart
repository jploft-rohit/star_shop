import 'package:get/get.dart';
import 'package:star_shop/app/controller/home_controller.dart';
import 'package:star_shop/app/controller/pre_order_controller.dart';
import 'package:star_shop/app/controller/search_controller.dart';

import '../controller/base_controller.dart';
import '../controller/my_profile_controller.dart';
import '../controller/profile_staff_controller.dart';


class BaseBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<PreOrderController>(() => PreOrderController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MyProfileController>(() => MyProfileController());
    Get.lazyPut<ProfileStaffController>(() => ProfileStaffController());
    Get.lazyPut<SearchController>(() => SearchController());
  }

}