import 'package:get/get.dart';

class CardAndTagsController extends GetxController{

  bool card1=false;
  bool card2=false;

  final List<String> dates = ['July 2', 'July 3', 'July 4','July 5'];
  final List<String> heading = ['Request\nRaised','Request\nAccepted','Card\nIssued','Received'];
  final List<String> statuses = ['Request\nRaised','Request\nAccepted','Card\nIssued','Received'];
  int curStep = 2; // 2 is kept minimum

  final imageList = [
    'assets/images/nfc1.png',
    'assets/images/nfc2.png',
    'assets/images/nfc3.png',
    'assets/images/nfc4.png',
  ];

  final quantityList = <int>[5,5,1,1].obs;

}