import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionRecordController extends GetxController with GetSingleTickerProviderStateMixin {

  final selectedOrderType = ''.obs;
  final List<String> orderTypeList = [
    'Canteen',
    'Star Store',
    'Uniform',
    'Stationary'
  ];

  TextEditingController? cardNumberController;
  TextEditingController? cardExpiryController;
  TextEditingController? cardHolderNameController;
  TextEditingController? amountController;
  final amountText = ''.obs;

  var type = 'today';
  var heading = 'Today Transactions';

  var tabListItems = ["Transaction", "Top-up Records"];
  late TabController tabController;
  final selectedTabPosition = 0.obs;

  TransactionRecordController(){
    cardNumberController = TextEditingController();
    cardExpiryController = TextEditingController();
    cardHolderNameController = TextEditingController();
    amountController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
  }




  @override
  void onInit(){
    super.onInit();
    type = Get.arguments['type'] as String;

    if(type == 'today'){
      heading = 'Today Transactions';
    } else {
      heading = 'Transactions Record';
    }
  }






}