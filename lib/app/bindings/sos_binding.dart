import 'package:get/get.dart';
import 'package:star_shop/app/controller/sos/sos_assembly_controller.dart';

import '../controller/sos/ask_for_help_controller.dart';
import '../controller/sos/fire_emergency_controller.dart';
import '../controller/sos/medical_support_sos_controller.dart';
import '../controller/sos/qr_scanner_controller.dart';
import '../controller/sos/sos_controller.dart';

class SOSBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SosAssemblyController>(() => SosAssemblyController());
    Get.lazyPut<SosController>(() => SosController());
    Get.lazyPut<AskForHelpController>(() => AskForHelpController());
    Get.lazyPut<FireEmergencyController>(() => FireEmergencyController());
    Get.lazyPut<MedicalSupportSosController>(() => MedicalSupportSosController());
    Get.lazyPut<QrScannerController>(() => QrScannerController(),);
  }
  
}