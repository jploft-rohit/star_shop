import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  TextEditingController? loginTextController;
  TextEditingController? fullNameController;
  TextEditingController? mobileController;
  TextEditingController? otpController;
  TextEditingController? employeeIdController;
  final enteredOtp = ''.obs;

  var roleImagesList = [
    'assets/images/ic_teacher.svg',
    'assets/images/ic_admin.svg',
    'assets/images/ic_driver.svg',
    'assets/images/ic_school_security.svg',
    'assets/images/ic_shop.svg',
    'assets/images/ic_nurse.svg',
  ];

  var roleNameList = ['Teacher','Admin','Driver/Supervisor','School Security','Shop','Nurse'];
  final selectedPos = 4.obs;


  AuthController(){
    loginTextController = TextEditingController();
    fullNameController = TextEditingController();
    mobileController = TextEditingController();
    otpController = TextEditingController();
    employeeIdController = TextEditingController();
  }


}