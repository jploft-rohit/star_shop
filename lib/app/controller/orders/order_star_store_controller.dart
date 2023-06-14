import 'package:get/get.dart';

class OrderStarStoreController extends GetxController{

  final selectedTypePos = 0.obs;
  final typeList = [
    'Confirmed',
    'Completed',
    'Cancelled',
    'Returned',
  ];

}