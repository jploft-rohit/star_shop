import 'package:get/get.dart';

class NotifyAuthoritiesController extends GetxController{


  final reasonList = [
    'I will be absent today.',
    'Going to school by my own vehicle.',
    'Returning home by my own vehicle'
  ].obs;

  final selectedReasonList = <String>[].obs;

  final selectedDaysPosList = <int>[].obs;
  final daysList = ['For Today', 'For Multiple Days'].obs;

}