import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileStaffController extends GetxController{

  final selectedAssignFor = ''.obs;
  final List<String> assignForItems = [
    'Item 1',
    'Item 2',
  ];

  final selectedGender = ''.obs;
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  final selectedNationality = ''.obs;
  final List<String> nationalityList = [
    'Saudi Arabia',
    'UAE',
    'India',
    'Pakistan',
    'Qatar'
  ];


  final selectedDepartment = ''.obs;
  final List<String> departmentList = [
    'Canteen',
    'Stationary',
    'Uniforms',
    'Star Store',
  ];

  TextEditingController? searchController;
  TextEditingController? nameController;
  TextEditingController? mobileController;
  TextEditingController? dobController;
  TextEditingController? emailController;
  TextEditingController? govtIDController;

  final featureList = [
    'Tap to detect',
    'Refund Transaction',
    'Change item details',
    'Change item amount',
    'Change item quantity',
    'Add new item',
    'Pre-order'
  ].obs;
  final selectedIndexes = <String>[].obs;
  final switchValue = true.obs;


  ProfileStaffController(){
    searchController = TextEditingController();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    dobController = TextEditingController();
    emailController = TextEditingController();
    govtIDController = TextEditingController();
  }

}