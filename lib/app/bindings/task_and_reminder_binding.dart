import 'package:get/get.dart';
import 'package:star_shop/app/controller/task_reminder_controller.dart';

class TaskAndReminderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TaskAndReminderController>(() => TaskAndReminderController());
  }

}