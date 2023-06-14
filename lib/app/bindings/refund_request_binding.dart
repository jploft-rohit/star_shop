import 'package:get/get.dart';
import 'package:star_shop/app/controller/refund_request_controller.dart';

class RefundRequestBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RefundRequestController>(() => RefundRequestController());
  }

}