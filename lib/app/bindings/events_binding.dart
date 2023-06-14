import 'package:get/get.dart';
import 'package:star_shop/app/controller/events_controller.dart';

class EventsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EventsController>(() => EventsController());
  }

}