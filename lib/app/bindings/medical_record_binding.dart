import 'package:get/get.dart';

import '../controller/medical_record_controller.dart';

class MedicalRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalRecordController>(() => MedicalRecordController());
  }
}
