import 'package:get/get.dart';

class OrderUniformController extends GetxController{

  final selectedTypePos = 0.obs;
  final typeList = [
    'Confirmed',
    'Completed',
    'Cancelled',
    'Returned',
  ];

}