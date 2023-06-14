import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCanteenController extends GetxController with GetTickerProviderStateMixin{

  final selectedTypePos = 0.obs;
  final typeList = [
    'Paid and Confirmed',
    'Preparing',
    'Served',
    'Returned',
  ];

  final selectedDayPos = 0.obs;
  final dayList = [
    'Today',
    'Tomorrow',
  ];

  TabController? durationController;


  final selectedClassPos = 0.obs;
  final classList = [
    'KG',
    'Cycle 1',
    'Cycle 2',
    'Cycle 3',
  ];

  OrderCanteenController(){
    durationController = TabController(length: 3, vsync: this);
  }



}