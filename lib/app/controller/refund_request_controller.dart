import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RefundRequestController extends GetxController{

  final selectedOrderType = ''.obs;
  final List<String> orderTypeList = [
    'Canteen',
    'Star Store',
    'Uniform',
    'Stationary'
  ];

  final selectedCategoryPos = 0.obs;
  final categoryList = [
    'Pending',
    'Approved',
    'Rejected'
  ];

  TextEditingController? commentController;

  RefundRequestController(){
    commentController = TextEditingController();
  }

}