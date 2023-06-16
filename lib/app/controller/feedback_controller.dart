import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController with GetSingleTickerProviderStateMixin{

  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];

  final selectedRole = ''.obs;
  final List<String> roleList = [
    'Complain',
    'Report'
  ];
  late TabController controller;
  final List<String> dates = ['July 2', 'July 3', 'July 4'];
  final List<String> heading = [
    'Concern\nRaised',
    'InProgress',
    'Concern\nSolved'
  ];
  int curStep = 3; // 2 is kept minimum
  var feedbackList = ['COMMENTS', 'ACCEPT'];
  final selectedFeedbackPos = 2.obs;

  TextEditingController? commentController;

  FeedbackController(){
    controller = TabController(vsync: this, length: 3);
    commentController = TextEditingController();
  }

}