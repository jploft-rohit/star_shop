import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransportationController extends GetxController with GetSingleTickerProviderStateMixin{


  TabController? tabController;
  var tabListItems = ["Departure Information", "Return Information"];
  final selectedTabPosition = 0.obs;


  final busNotificationList = <String>[
    'Ready',
    'Wait 5 minutes',
    'Going by own Vehicle',
    'Absent Today'
  ].obs;
  final selectedBusNotificationPos = 2.obs;


  TransportationController(){
    tabController = TabController(length: 2, vsync: this);
  }


}