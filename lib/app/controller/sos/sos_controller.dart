import 'package:get/get.dart';

class SosController extends GetxController {
  final activeBox = 'fight'.obs;
  final activeTab = 'nfc'.obs;
  var starGradeValue = ["Grade 1", "Grade 2", "Grade 3"];
  var medicalRoleValue = ["Role 1", "Role 2", "Role 3"];
  String? selectedStarGrade = 'Grade 1';
  var startOtherValue = ["H1", "H2", "H3"];
  String? selectedStarOther = 'H1';
  String? selectedMedicalRole = 'H1';


  void changeActiveBox(String box) {
    activeBox.value = box;
  }

  void changeActiveTab(String tab) {
    activeTab.value = tab;
  }
}
