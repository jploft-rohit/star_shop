import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController{

  TextEditingController? nameController;
  TextEditingController? mobileController;
  TextEditingController? alternateMobileController;
  TextEditingController? dobController;
  TextEditingController? emailController;
  TextEditingController? addressController;
  TextEditingController? stateController;
  TextEditingController? nationalityController;
  TextEditingController? emiratesIDController;
  TextEditingController? idExpiryController;


  EditProfileController(){
    nameController = TextEditingController(text: 'Rafiq Khan');
    mobileController = TextEditingController(text: '9563214563');
    alternateMobileController = TextEditingController(text: '4568468436');
    dobController = TextEditingController(text: '17 March, 1985');
    emailController = TextEditingController(text: 'rafiq_khan007@gmail.com');
    addressController = TextEditingController();
    stateController = TextEditingController();
    nationalityController = TextEditingController();
    emiratesIDController = TextEditingController(text: 'GTS8995344');
    idExpiryController = TextEditingController(text: '15 Sep, 2024');
  }


}