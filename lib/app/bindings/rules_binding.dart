import 'package:get/get.dart';

import '../controller/rules_controller.dart';

class RulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RulesController>(() => RulesController());
  }
}
