import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationaryMenuController extends GetxController{
  var tabListItems = ["All", "Category 1", "Category 2", "Category 3", "Category 4"];
  final selectedTabPosition = 0.obs;

  TextEditingController? searchController;

  StationaryMenuController(){
    searchController = TextEditingController();
  }
}