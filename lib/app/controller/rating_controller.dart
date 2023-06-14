import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingController extends GetxController with GetSingleTickerProviderStateMixin{

  TextEditingController? busTextEditingController;
  TextEditingController? staffTextEditingController;
  final isBusAnonymousChecked = true.obs;
  final isStaffAnonymousChecked = true.obs;

  var starRatingImageList = [
    'assets/images/listening.svg',
    'assets/images/brush_teeth.svg',
    'assets/images/ready_for_school.svg',
    'assets/images/reading.svg',
    'assets/images/ready_for_bed.svg',
    'assets/images/out_of_bed.svg',
    'assets/images/helping.svg',
    'assets/images/learning_time.svg',
    'assets/images/outside_time.svg',
  ];

  var starHabitNames = [
    'Listening',
    'Brush teeth',
    'Ready for school',
    'Reading',
    'Ready for bed',
    'Out of bed',
    'Helping',
    'Learning time',
    'Outside time',
  ];

  var positiveStarList = [2,2,3,2,3,2,3,2,2];
  var needStarList = [1,1,1,1,1,1,1,1,1];

  final isMinBusRating = false.obs;
  final isMinStaffRating = false.obs;


  var tabListItems = ["Positive", "Needs"];
  final selectedTabPosition = 0.obs;
  late TabController controller;


  RatingController(){
    controller = TabController(length: 2, vsync: this);
    busTextEditingController = TextEditingController();
    staffTextEditingController = TextEditingController();
  }

  final selectedDriver = ''.obs;
  final List<String> driverItems = [
    'Rahish Khan',
    'Nawaj Alam',
    'Nawaj Khan',
    'Rahish Alam',
  ];

  final selectedBusId = ''.obs;
  final List<String> busItems = [
    '#2908789',
    '#2908780',
    '#2908778',
    '#2908767',
  ];



}