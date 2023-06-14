import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/circular_bordered_button.dart';
import 'package:star_shop/common/direction_view.dart';

import '../../../../../../common/bordered_button.dart';
import '../../../../../../common/color_constants.dart';
import '../../../../../../common/utils.dart';
import '../../../../../controller/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColorLight,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: getLargeTextFontSIze() * 1.2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.notificationView);
                    },
                    child: SvgPicture.asset('assets/images/notification.svg',height: getLargeTextFontSIze() * 1.2),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: ColorConstants.white,
                      border: Border.all(color: ColorConstants.primaryColor),
                      borderRadius: getCurvedBorderRadius()),
                  child: SvgPicture.asset('assets/images/user.svg',height: getLargeTextFontSIze()*3,),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        color: ColorConstants.borderColor2
                      ), child: SvgPicture.asset('assets/images/upload_icon.svg',height: getNormalTextFontSIze(),),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Expanded(
                child: Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: ColorConstants.white,
                  boxShadow: [getDeepBoxShadow()],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    buildEditText('Name', controller.nameController),
                    // buildEditText('Mobile No', controller.mobileController),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addText('Mobile No', getNormalTextFontSIze(), ColorConstants.black,
                            FontWeight.normal),
                        Stack(
                          children: [
                            addPrimaryColorEditText(controller.mobileController!, ''),
                            Positioned(
                                right: 10,
                                bottom: 15,
                                child: GestureDetector(
                                  onTap: (){
                                    Get.focusScope!.unfocus();
                                    showSuccessChangeNumberDialog(context);
                                  },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ColorConstants.primaryColorLight,
                                    boxShadow: [getDeepBoxShadow()],
                                    border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
                                    borderRadius: getBorderRadiusCircular()),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                  child: Center(
                                    child: addText('CHANGE', getSmallTextFontSIze(),
                                        ColorConstants.primaryColor, FontWeight.w500),
                                  ),
                                ),
                              ),
                            ))
                          ],
                        ),
                        const Divider(
                          color: ColorConstants.borderColor2,
                          height: 0,
                          thickness: 1.5,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addText('Alternate Mobile No', getNormalTextFontSIze(), ColorConstants.black,
                            FontWeight.normal),
                        Stack(
                          children: [
                            addPrimaryColorEditText(controller.alternateMobileController!, ''),
                            Positioned(
                                right: 10,
                                bottom: 15,
                                child: GestureDetector(
                                  onTap: (){
                                    Get.focusScope!.unfocus();
                                    showSuccessChangeNumberDialog(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorConstants.primaryColorLight,
                                        boxShadow: [getDeepBoxShadow()],
                                        border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
                                        borderRadius: getBorderRadiusCircular()),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                      child: Center(
                                        child: addText('CHANGE', getSmallTextFontSIze(),
                                            ColorConstants.primaryColor, FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        const Divider(
                          color: ColorConstants.borderColor2,
                          height: 0,
                          thickness: 1.5,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),



                    buildEditText('DOB', controller.dobController),


                    buildEditText('Email', controller.emailController),



                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addText('Address', getNormalTextFontSIze(), ColorConstants.black,
                            FontWeight.normal),
                        Stack(
                          children: [
                            addPrimaryColorEditText(controller.addressController!, ''),
                            Positioned(
                                right: 10,
                                bottom: 15,
                                child: GestureDetector(
                                  onTap: (){
                                    Get.focusScope!.unfocus();
                                    Get.to(const DirectionView());
                                  },
                                  child: SvgPicture.asset('assets/images/ic_map.svg'),
                                ))
                          ],
                        ),
                        const Divider(
                          color: ColorConstants.borderColor2,
                          height: 0,
                          thickness: 1.5,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),


                    buildEditText('State', controller.stateController),
                    buildEditText('Nationality', controller.nationalityController),


                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText('Emirates ID', getNormalTextFontSIze(), ColorConstants.black,
                                FontWeight.normal),
                            SizedBox(
                                width: 40.w,
                                child: addPrimaryColorEditText(controller.emiratesIDController!, '')),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText('Expiry Date', getNormalTextFontSIze(), ColorConstants.black,
                                FontWeight.normal),
                            Row(
                              children: [
                                SizedBox(
                                    width: 40.w,
                                    child: addPrimaryColorEditText(controller.idExpiryController!, '')),
                                GestureDetector(
                                    onTap: (){
                                      showPicker(context);
                                    },
                                    child: SvgPicture.asset('assets/images/ic_calendar.svg'))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),


                    const Divider(
                      color: ColorConstants.borderColor2,
                      height: 0,
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        addText('Upload Document', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),

                        SvgPicture.asset('assets/images/ic_upload.svg',color: ColorConstants.primaryColor,)


                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    const Divider(
                      color: ColorConstants.borderColor2,
                      // height: 10,
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),




                    Center(child: addText('Upload your document Till: 25 July, 2022', getSmallTextFontSIze(), Colors.red, FontWeight.bold)),

                    SizedBox(height: 4.h,),

                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Get.focusScope!.unfocus();
                          showToast('Profile Updated');
                        },
                        child: BorderedButton(width: 50.w, text: 'SAVE'),
                      ),
                    ),

                    SizedBox(height: 4.h,),





                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildEditText(String heading, TextEditingController? controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addText(heading, getNormalTextFontSIze(), ColorConstants.black,
            FontWeight.normal),
        addPrimaryColorEditText(controller!, ''),
        const Divider(
          color: ColorConstants.borderColor2,
          height: 0,
          thickness: 1.5,
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }


  void showSuccessChangeNumberDialog(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                shape:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                content: SizedBox(
                  width: 100.w,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: ColorConstants.primaryColor),
                                        color: ColorConstants.primaryColorLight
                                      ),
                                      child: Icon(Icons.check,color: ColorConstants.primaryColor,size: getLargeTextFontSIze()*1.5,))),
                            ),
                            Positioned(
                                right: 1,
                                child: GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child:Icon(Icons.close,size: getLargeTextFontSIze()*1.2,color: ColorConstants.borderColor,),
                            ))
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        addAlignedText(
                            'Request to change registered number was sent successfully. You will receive an SMS notification of approval.',
                            17,
                            ColorConstants.black,
                            FontWeight.w700),
                        SizedBox(height: 2.h,),
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
