import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final GlobalKey<ScaffoldState> key = GlobalKey();
  final scheduleSelectedPos = 0.obs;

  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];

  List<DashboardGridItems> gridList = [
    DashboardGridItems(title: 'Current Orders', count: '24'),
    DashboardGridItems(title: 'Order Items', count: '15'),
    DashboardGridItems(title: 'Staff Orders', count: '5'),
    DashboardGridItems(title: 'Star Orders', count: '17'),
    DashboardGridItems(title: 'Pending Orders', count: '15'),
    DashboardGridItems(title: 'Completed Orders', count: '5'),
    DashboardGridItems(title: 'Today Transactions', count: '132'),
    DashboardGridItems(title: 'Transactions Record', count: '132'),
  ];

}

class DashboardGridItems{
  String title;
  String count;
  DashboardGridItems({required this.title, required this.count});
}