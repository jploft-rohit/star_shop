import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOrderController extends GetxController with GetSingleTickerProviderStateMixin{

  final selectedPos = 0.obs;
  var optionsImageList = [
    'assets/images/nfc.svg',
    'assets/images/qrcode.svg',
    'assets/images/hand.svg',
  ];

  final baseHeader = 'Canteen Menu'.obs;

  TabController? controller;
  var tabListItems = ["Canteen", "Stationary", "Uniform", "Stars Store"];
  final selectedTabPosition = 0.obs;



  final selectedPaymentPos = 0.obs;
  var paymentImageList = [
    'assets/images/ic_master_card.svg',
    'assets/images/ic_wallet.svg',
    'assets/images/ic_cash.svg',
  ];

  var paymentTitleList = [
    'Visa/Mastercard',
    'Wallet',
    'Cash',
  ];

  TextEditingController? searchController;


  CreateOrderController(){
    controller = TabController(length: 4, vsync: this);
    searchController = TextEditingController(text: '879574');
  }

}