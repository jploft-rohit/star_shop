import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsController extends GetxController{


  final currentTab = 'Upcoming'.obs;

  void changeTab(String tab) {
    currentTab.value = tab;
  }
  TextEditingController? reasonController;

  EventsController(){
    reasonController = TextEditingController();
  }


}