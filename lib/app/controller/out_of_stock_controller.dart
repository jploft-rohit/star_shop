import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutOfStockItemController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController controller;
  final selectedCategoryPos = 0.obs;
  var canteenList = ['Mango Juice', 'Lunch Box', 'Cookies'];
  var stationaryList = ['Notebook', 'School Bag', 'Blue Pen', 'Drawing Colors'];
  var uniformList = ['Coat', 'Shoes'];
  var starStoreList = ['NFC Tags', 'NFC Card'];
  final categoryList = [
    'Finished',
    'About to Finish',

  ];

  TextEditingController? canteenSearchController;
  TextEditingController? stationarySearchController;
  TextEditingController? uniformSearchController;
  TextEditingController? starStoreSearchController;

  OutOfStockItemController() {
    controller = TabController(length: 4, vsync: this);
    canteenSearchController = TextEditingController();
    stationarySearchController = TextEditingController();
    uniformSearchController = TextEditingController();
    starStoreSearchController = TextEditingController();
  }

}