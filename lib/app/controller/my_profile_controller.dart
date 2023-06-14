import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController controller;

  TextEditingController? addFamilyNameController;
  TextEditingController? addFamilyMobileController;
  TextEditingController? deleteFamilyReasonController;

  final addFamilyDOB = 'dd/mm/yyyy'.obs;
  final addFamilyIDExpiryDate = 'dd/mm/yyyy'.obs;
  final addFamilyUploadId = 'Upload ID'.obs;
  final addFamilyRelation = 'Mother'.obs;
  final List<String> relationItems = [
    'Mother',
    'Father',
    'Brother',
    'Sister',
    'Others'
  ];

  MyProfileController(){
    controller = TabController(vsync: this, length: 4);
    addFamilyNameController = TextEditingController();
    addFamilyMobileController = TextEditingController();
    deleteFamilyReasonController = TextEditingController();


  }


}