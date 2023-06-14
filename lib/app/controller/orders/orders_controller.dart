import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController with GetSingleTickerProviderStateMixin {

  TabController? tabController;

  OrdersController(){
    tabController = TabController(length: 4, vsync: this);
  }


}