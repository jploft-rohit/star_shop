import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  int initialIndex = 0;


  @override
  void onInit() {
    super.onInit();
    if(Get.arguments['initialIndex'] != null){
      initialIndex = Get.arguments['initialIndex'] as int;
    }

  }




  ProductController() {
    controller = TabController(length: 4, vsync: this);
  }
}
