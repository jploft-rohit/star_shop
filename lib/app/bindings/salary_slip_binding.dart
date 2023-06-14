import 'package:get/get.dart';

import '../controller/salary_slip_controller.dart';

class SalarySlipBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SalaryClipController>(() => SalaryClipController());
  }
  
}