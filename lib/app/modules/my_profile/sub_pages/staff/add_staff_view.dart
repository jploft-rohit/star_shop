
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/profile_staff_controller.dart';
import 'package:star_shop/common/bordered_button.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/utils.dart';

import '../../../../../common/app_header.dart';

class AddStaffView extends GetView<ProfileStaffController>{
  const AddStaffView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(5.h), child:  AppHeader(showBackIcon: true, title: 'Add Staff',)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FadeInUp(
          duration: const Duration(milliseconds: 450,),
          delay: const Duration(milliseconds: 250,),

          child: Column(
            children: [

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 3.h,),
                    buildInputField('Name', controller.nameController!),
                    SizedBox(height: 2.h,),
                    buildInputField('Mobile Number', controller.mobileController!),
                    SizedBox(height: 2.h,),
                    buildInputField('DOB', controller.dobController!),
                    SizedBox(height: 2.h,),
                    buildInputField('Email', controller.emailController!),
                    SizedBox(height: 2.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 1,
                            child: addText('Nationality', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold)),
                        Flexible(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                              decoration: getEditTextDecoration(),
                              child: buildSchoolDropDown(controller.nationalityList,
                                  controller.selectedNationality, 'Select', 100.w),
                            )),


                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 1,
                            child: addText('Department', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold)),
                        Flexible(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                              decoration: getEditTextDecoration(),
                              child: buildSchoolDropDown(controller.departmentList,
                                  controller.selectedDepartment, 'Select', 100.w),
                            )),


                      ],
                    ),
                    SizedBox(height: 2.h,),
                    buildInputField('Govt. Id', controller.govtIDController!),
                    SizedBox(height: 2.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 1,
                            child: addText('Expiry Date', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold)),
                        Flexible(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                              decoration: getEditTextDecoration(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  addText('dd/mm/yyyy', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                                  SvgPicture.asset('assets/images/fab_calendar.svg',height: getNormalTextFontSIze(),color: ColorConstants.gretTextColor,)
                                ],
                              ),
                            )),


                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 1,
                            child: addText('Upload\nDocuments', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold)),
                        Flexible(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                              decoration: getEditTextDecoration(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset('assets/images/ic_upload.svg',height: getNormalTextFontSIze(),color: ColorConstants.gretTextColor,)
                                ],
                              ),
                            )),


                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Align(
                        alignment: Alignment.topLeft,
                        child: addText('Select School', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold)),
                    SizedBox(height: 2.h,),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  boxShadow: [getDeepBoxShadow()],
                  color: ColorConstants.white
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: ColorConstants.primaryColor,
                      activeColor: ColorConstants.primaryColorLight,
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(width: 1.0, color: ColorConstants.primaryColor,),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      value: true,

                      onChanged: (bool? value) {
                        // controller.isBusAnonymousChecked.value = value!;
                      },
                    ),
                    Expanded(child: addText('Ignite School', getNormalTextFontSIze(), ColorConstants.black, FontWeight.w500)),

                    Checkbox(
                      checkColor: ColorConstants.primaryColor,
                      activeColor: ColorConstants.primaryColorLight,
                      value: true,
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(width: 1.0, color: ColorConstants.primaryColor,),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      onChanged: (bool? value) {
                        // controller.isBusAnonymousChecked.value = value!;
                      },
                    ),
                    Expanded(child: addText('Daka Public School', getNormalTextFontSIze(), ColorConstants.black, FontWeight.w500))
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 2.h),
                decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: getCurvedBorderRadius(),
                    boxShadow: [getDeepBoxShadow()]
                ), child:
              GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.zero,
                crossAxisSpacing: 0,
                childAspectRatio: 4.0,
                mainAxisSpacing: 0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                    controller.featureList.length, (index) {
                  return Obx(() => Card(
                    color: Colors.white,
                    margin: EdgeInsets.zero,
                    elevation: 0.0,
                    child: CheckboxListTile(
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      dense: true,
                      checkboxShape: const RoundedRectangleBorder(borderRadius: BorderRadius. all(Radius. circular(5.0))),
                      checkColor: ColorConstants.primaryColor,
                      activeColor: ColorConstants.primaryColorLight,
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(width: 1.0, color: ColorConstants.primaryColor,),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      title: addText(controller.featureList[index], getNormalTextFontSIze()-1, ColorConstants.black, FontWeight.w500),
                      value: controller.selectedIndexes.contains(controller.featureList[index]),
                      onChanged: (_) {
                        if (controller.selectedIndexes.contains(controller.featureList[index])) {
                          controller.selectedIndexes.remove(controller.featureList[index]);
                        } else {
                          controller.selectedIndexes.add(controller.featureList[index]);

                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ));
                }),
              ),

              ),
              SizedBox(height: 2.h,),
              GestureDetector(
                onTap: (){
                  _showActivationDialogue(context);
                },
                child: BorderedButton(width: 50.w, text: 'Activate Account'),
              ),
              SizedBox(height: 5.h,),




            ],
          ),
        ),
      ),
    );
  }


  Widget buildInputField(String title,TextEditingController controller){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 1,
            child: addText(title, getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold)),
        Flexible(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: getEditTextDecoration(),
              child: addSmallEditText(controller, 'Type here.....'),
            )),


      ],
    );
  }

  void _showActivationDialogue(BuildContext context) {
    showGeneralDialog(barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                content: SizedBox(
                  width: 100.w,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        addAlignedText('Your activation request has been sent successfully, after revision,you will be informed about your activation status via SMS & Email.',
                            getHeadingTextFontSIze(),
                            ColorConstants.black, FontWeight.w500),
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            Get.back();
                            Get.back();
                          },
                          child: BorderedButton(width: 40.w, text: 'Ok'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }

}