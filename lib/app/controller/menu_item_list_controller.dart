import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItemListController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController controller;
  var canteenList = ['Mango Juice', 'Lunch Box', 'Cookies'];
  var stationaryList = ['Notebook', 'School Bag', 'Blue Pen', 'Drawing Colors'];
  var uniformList = ['Coat', 'Shoes'];
  var starStoreList = ['NFC Tags', 'NFC Card'];

  TextEditingController? canteenSearchController;
  TextEditingController? stationarySearchController;
  TextEditingController? uniformSearchController;
  TextEditingController? starStoreSearchController;

  MenuItemListController() {
    controller = TabController(length: 4, vsync: this);
    canteenSearchController = TextEditingController();
    stationarySearchController = TextEditingController();
    uniformSearchController = TextEditingController();
    starStoreSearchController = TextEditingController();
  }
}
