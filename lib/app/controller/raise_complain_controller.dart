import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RaiseComplainController extends GetxController{

  TextEditingController? titleController;
  TextEditingController? messageController;
  TextEditingController? selectPersonController;

  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];

  final selectedComplainType = ''.obs;
  final List<String> typeItems = [
    'Complain',
    'Report'
  ];

  final selectedComplainFor = ''.obs;
  final List<String> complainForList = [
    'Complain',
    'Report'
  ];


  final selectedRole = ''.obs;
  final List<String> roleList = [
    'Complain',
    'Report'
  ];

  final selectedComplainType2 = ''.obs;
  final List<String> complainTypeList = [
    'Complain',
    'Report'
  ];


  final isEdit = false.obs;


  @override
  void onInit(){
    super.onInit();
    isEdit.value = Get.arguments['isEdit'];
  }


  RaiseComplainController(){
    titleController = TextEditingController();
    messageController = TextEditingController();
    selectPersonController = TextEditingController();
  }

}