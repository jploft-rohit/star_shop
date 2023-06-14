import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CardAndTagCartController extends GetxController{


  final  friendsRadioValue = 'Pick-up from school.'.obs;
  final  servingRadioValue = 'Deliver'.obs;
  final  orderTypeRadioValue = 'Every Week'.obs;

  TextEditingController? cardNumberController;
  TextEditingController? cardExpiryController;
  TextEditingController? cardHolderNameController;

  final daysList = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ].obs;
  final selectedIndexes = <String>[].obs;


  TextEditingController? amountController;
  final amountText = ''.obs;

  CardAndTagCartController() {
    cardNumberController = TextEditingController();
    cardExpiryController = TextEditingController();
    cardHolderNameController = TextEditingController();
    amountController = TextEditingController();
  }

}