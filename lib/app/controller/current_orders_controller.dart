import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentOrdersController extends GetxController  with GetSingleTickerProviderStateMixin {

  TabController? tabController;

  CurrentOrdersController(){
    tabController = TabController(length: 4, vsync: this);
  }

}
