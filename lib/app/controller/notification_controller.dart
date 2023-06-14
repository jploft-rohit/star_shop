import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{

  final wallets = false.obs;
  final performanceRating = true.obs;
  final changesOnTrips = true.obs;
  final eventUpdates = false.obs;
  final starsChats = true.obs;
  final parentChats = false.obs;
  final adminChats = true.obs;
  final busDepartureTime = false.obs;


  TextEditingController? lateHoursController;
  TextEditingController? lateMinutesController;

  NotificationController(){
    lateHoursController = TextEditingController(text: '00');
    lateMinutesController = TextEditingController(text: '10');
  }


}