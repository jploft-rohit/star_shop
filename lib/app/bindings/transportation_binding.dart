import 'package:get/get.dart';

import '../controller/transportation/bus_location_controller.dart';
import '../controller/transportation/notify_authorities_controller.dart';
import '../controller/transportation/transportation_controller.dart';

class TransportationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TransportationController>(() => TransportationController());
    Get.lazyPut<NotifyAuthoritiesController>(() => NotifyAuthoritiesController());
    Get.lazyPut<BusLocationController>(() => BusLocationController());
  }
  
}