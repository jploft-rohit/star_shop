import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateProductController extends GetxController{

  TextEditingController? productNameController;
  TextEditingController? productDescriptionController;
  TextEditingController? productPriceController;
  TextEditingController? productPriceController1;
  TextEditingController? quantityController;

  final selectedCategoryType = ''.obs;
  final List<String> canteenCategoryList = [
    'Type 1',
    'Type 2'
  ];
  final selectedAllergyIndexes = <String>[].obs;
  var allergyList = [
    'Crustacean Shellfish',
    'Lupin',
    'Egg',
    'Molluscan Shellfish',
    'Fish',
    'Mustard Sesame',
    'Milf',
    'Bee Pollen/Propolis',
    'Peanut',
    'Beef',
    'Soy',
    'Chicken',
    'Tree Nuts',
    'Latex(Natural Rubber)',
    'Wheat',
    'Mango',
    'Cereals w/ Gluten',
    'Peach',
    'Sulfates',
    'Pork',
    'Buckwheat',
    'Royal Jelly',
    'Celery',
    'Tomato'

  ];

  final sizeControllerList = <TextEditingController>[].obs;

  CreateProductController(){
    productNameController = TextEditingController();
    productDescriptionController = TextEditingController();
    productPriceController = TextEditingController();
    quantityController = TextEditingController();
  }

  bool isPreOrder = false;
  String type = 'Canteen';
  bool isEdit = false;

  @override
  void onInit(){
    super.onInit();
    isPreOrder = Get.arguments['isPreOrder'] as bool;
    isEdit = Get.arguments['isEdit'] as bool;
    type = Get.arguments['type'] as String;
    sizeControllerList.add(TextEditingController());
  }

}