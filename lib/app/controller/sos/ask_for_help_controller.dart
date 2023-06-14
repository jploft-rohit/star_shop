import 'package:get/get.dart';

class AskForHelpController extends GetxController {
  final currentTab = 'I\'m stuck at my location'.obs;



  void changeTab(String tab) {
    currentTab.value = tab;
  }
}
