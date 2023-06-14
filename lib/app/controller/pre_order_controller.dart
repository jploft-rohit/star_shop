import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreOrderController extends GetxController  with GetSingleTickerProviderStateMixin {

  TabController? tabController;

  PreOrderController(){
    tabController = TabController(length: 4, vsync: this);
  }

}
