import 'package:get/get.dart';

import '../controller/add_feedback_controller.dart';
import '../controller/feedback_controller.dart';


class FeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedbackController>(() => FeedbackController());
    Get.lazyPut<AddFeedbackController>(() => AddFeedbackController());
  }

}