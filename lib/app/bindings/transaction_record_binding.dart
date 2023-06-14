import 'package:get/get.dart';
import 'package:star_shop/app/controller/transaction_record_controller.dart';

class TransactionRecordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TransactionRecordController>(() => TransactionRecordController());
  }
  
}