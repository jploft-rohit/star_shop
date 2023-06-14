import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuUniformController extends GetxController{
  var tabListItems = ["All", "Category 1", "Category 2", "Category 3", "Category 4"];
  final selectedTabPosition = 0.obs;

  final sizeSelectedPos = 0.obs;
  var sizeList = [
    '28','30','32','34','36'
  ];

  TextEditingController? searchController;

  //manual size
  TextEditingController? headSizeController;
  TextEditingController? neckSizeController;
  TextEditingController? shoulderSizeController;
  TextEditingController? chestSizeController;
  TextEditingController? sleeveSizeController;
  TextEditingController? wristSizeController;
  TextEditingController? bicepsSizeController;
  TextEditingController? shortSizeController;
  TextEditingController? shoeSizeController;
  TextEditingController? bestMatchingShirtController;
  TextEditingController? bestMatchingPantSizeController;
  TextEditingController? bestMatchingHatSizeController;
  TextEditingController? bestMatchingWristBandSizeController;

  MenuUniformController(){
    searchController = TextEditingController();
  }

  void initializeManualSizeEditTexts(){
    headSizeController = TextEditingController(text: '85.9 cm');
    neckSizeController = TextEditingController(text: '39.7 cm');
    shoulderSizeController = TextEditingController(text: '39.7 cm');
    chestSizeController = TextEditingController(text: '92.8 cm');
    sleeveSizeController = TextEditingController(text: '97.8 cm');
    wristSizeController = TextEditingController(text: '88.1 cm');
    bicepsSizeController = TextEditingController(text: '27.8 cm');
    shortSizeController = TextEditingController(text: '27.8 cm');
    shoeSizeController = TextEditingController(text: '26.2 cm');
    bestMatchingShirtController = TextEditingController(text: '30');
    bestMatchingPantSizeController = TextEditingController(text: 'No Matching size in our store, you can buy un-stitching cloth with photo of the style to have it stitch. ');
    bestMatchingHatSizeController = TextEditingController(text: 'L');
    bestMatchingWristBandSizeController = TextEditingController(text: 'S');
  }


}