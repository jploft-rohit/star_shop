import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/feedback_and_help/select_person_dialog.dart';
import '../../../common/app_header.dart';
import '../../../common/bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/add_feedback_controller.dart';


class AddFeedbackView extends GetView<AddFeedbackController>{
  const AddFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child:  AppHeader(
            showBackIcon: true,
            title: controller.isEdit ? 'Edit' : 'Feedback & Help',
          )),
      //Spacer()
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor),
                  color: ColorConstants.primaryColorLight),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: buildSchoolDropDown(controller.schoolItems, controller.selectedSchool, 'Hint', 100.w),
            ),

            SizedBox(height: 2.h,),
            Container(
              width: 100.w,
              decoration: getEditTextDecoration(),
              child: buildDropDown(controller.typeItems, controller.selectedType, 'Select Type'),
            ),

            SizedBox(height: 2.h,),
            GestureDetector(
              onTap: (){
                showSelectPersonDialog();
              },
              child: Container(
                width: 100.w,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                decoration: getEditTextDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Select person', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                  ],
                ),
              ),
            ),

            SizedBox(height: 2.h,),
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: getEditTextDecoration(),
              child: addSmallEditText(controller.titleController!, 'Title'),
            ),


            SizedBox(height: 2.h,),
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: getEditTextDecoration(),
              child: buildLineEditText(controller.messageController!, 'Message'),
            ),

            SizedBox(height: 2.h,),
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              decoration: getEditTextDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText('Upload file or Photo', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                  SvgPicture.asset('assets/images/ic_upload.svg')
                ],
              ),
            ),

            SizedBox(height: 2.h,),
            GestureDetector(
              onTap: (){
                showToast('Request Submitted');
              },
              child: BorderedButton(width: 40.w, text: 'SUBMIT'),
            )

          ],
        ),
      ),
    );
  }

  void showSelectPersonDialog() {
    Get.dialog(const SelectPersonDialog());
  }



  Widget buildDropDown(List<String> list,RxString selectedValue,String hint) {
    return DropdownButtonHideUnderline(
      child: Obx(() => DropdownButton2(
        buttonPadding: const EdgeInsets.symmetric(horizontal: 20),
        hint: Text(
          hint.tr,
          style: TextStyle(
              fontSize: getNormalTextFontSIze(),
              color: ColorConstants.black),
        ),
        items: list
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontSize: getNormalTextFontSIze(),
            ),
          ),
        ))
            .toList(),
        value: selectedValue.value.isNotEmpty
            ? selectedValue.value
            : null,
        onChanged: (value) {
          selectedValue.value = value as String;
        },

        iconSize: 30,
        icon: const Icon(Icons.arrow_drop_down,color: ColorConstants.lightGreyColor,),
        buttonWidth: 100.w,
        dropdownElevation: 1,
        dropdownDecoration: BoxDecoration(
          color: ColorConstants.white,
          boxShadow: [getDeepBoxShadow()],
        ),
      )),
    );
  }

}