import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CanteenMenuController extends GetxController{

  var tabListItems = ["All", "Breakfast", "Lunch", "Snacks", "Beverages"];
  final selectedTabPosition = 0.obs;

  TextEditingController? searchController;


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



  CanteenMenuController(){
    searchController = TextEditingController();
  }

}