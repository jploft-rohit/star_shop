import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BusLocationController extends GetxController{

  TextEditingController? sectorController;
  TextEditingController? areaController;
  TextEditingController? streetController;
  TextEditingController? buildingController;
  TextEditingController? flatController;
  TextEditingController? landmarkController;
  TextEditingController? mobileController;
  TextEditingController? landlineController;
  TextEditingController? locationController;


  BusLocationController(){
    locationController = TextEditingController();
    sectorController = TextEditingController(text: 'Dubai');
    areaController = TextEditingController(text: 'Jumeriah');
    streetController = TextEditingController(text: '53 B');
    buildingController = TextEditingController(text: 'KM Tower A');
    flatController = TextEditingController(text: '#123456');
    landmarkController = TextEditingController(text: 'Jumeriah');
    mobileController = TextEditingController(text: '0503664321');
    landlineController = TextEditingController(text: '0503664382');
  }

}