import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/home_controller.dart';
import 'package:star_shop/app/controller/profile_staff_controller.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/custom_fab.dart';
import 'package:star_shop/common/utils.dart';

import '../../../../../common/custom_switch.dart';

class ProfileStaffView extends GetView<ProfileStaffController> {
  const ProfileStaffView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFAB(isIcon: true, buttonText: 'Add Staff',icon: Icons.add,onButtonClicked: ()=>Get.toNamed(Routes.addStaffView),),
      backgroundColor: ColorConstants.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor2)),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/images/ic_staff.svg',
                        height: getLargeTextFontSIze(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: buildBoldSchoolDropDown(
                              Get.find<HomeController>().schoolItems,
                              Get.find<HomeController>().selectedSchool,
                              'Hint',
                              100.w)),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const Divider(
                    color: ColorConstants.borderColor2,
                    thickness: 1,
                    height: 0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/images/ic_staff.svg',
                        height: getLargeTextFontSIze(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: buildBoldSchoolDropDown(controller.assignForItems,
                              controller.selectedAssignFor, 'Assign For', 100.w)),
                      SizedBox(
                          height: getHeadingTextFontSIze() * 2,
                          child: const VerticalDivider(
                            color: ColorConstants.borderColor2,
                            thickness: 1,
                          )),
                      SvgPicture.asset(
                        'assets/images/ic_gender.svg',
                        height: getLargeTextFontSIze(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: buildBoldSchoolDropDown(controller.genderItems,
                              controller.selectedGender, 'Gender', 100.w)),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const Divider(
                    color: ColorConstants.borderColor2,
                    thickness: 1,
                    height: 0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                      const Icon(Icons.search,color: ColorConstants.lightTextColor,),
                        Expanded(
                          child: addSmallEditText(
                              controller.searchController!, 'Search Staff,ID...'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 1.h,),
            buildStaffList(),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }

  Widget buildStaffList(){
    return ListView.builder(
      itemCount: 1,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1,vertical: 10),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: getCurvedBorderRadius(),
                      boxShadow: [getBoxShadow()],
                      color: ColorConstants.white
                  ),
                  child: Row(

                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 15.w,
                            width: 15.w,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorConstants.primaryColor),
                                borderRadius: getCurvedBorderRadius(),
                                color: ColorConstants.white),
                            child: SvgPicture.asset('assets/images/user.svg'),
                          ),
                          SizedBox(
                              width: 15.w,
                              child: addAlignedText('Romaan Khan', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold)),
                          addText('#345663', getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                            buildInfoItems('School', 'UAE Public School'),
                            buildInfoItems('School ID', '#46343645368'),
                            buildInfoItems('Blood Type', 'A+'),
                            buildInfoItems('User Type', 'Shop User'),
                            buildInfoItems('Assign For', 'Canteen'),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                              onTap:(){
                                showQrDialog();
                              },
                              child: SvgPicture.asset('assets/images/qrcode.svg',width: 15.w,)),

                          SizedBox(height: 1.h,),
                          Row(children: [
                            addText('Off', getSmallTextFontSIze(), ColorConstants.gretTextColor,
                                FontWeight.normal),
                            const SizedBox(
                              width: 5,
                            ),
                            Obx(() => CustomSwitch(
                              key: GlobalKey(),
                              value: controller.switchValue.value,
                              enableColor: ColorConstants.primaryColorLight,
                              disableColor: ColorConstants.lightGreyColor,
                              width: 36,
                              height: 18,
                              switchHeight: 15,
                              switchWidth: 15,
                              onChanged: (bool value) {
                                controller.switchValue.value = !controller.switchValue.value;
                              },
                            )),
                            const SizedBox(
                              width: 5,
                            ),
                            addText('On', getSmallTextFontSIze(), ColorConstants.gretTextColor,
                                FontWeight.normal),
                          ],)
                        ],
                      ),
                      const SizedBox(width: 10,),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 5,
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.staffRating);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstants.white,
                          boxShadow: [getBoxShadow()]
                      ), child: SvgPicture.asset('assets/images/star.svg',height: getHeadingTextFontSIze(),),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildInfoItems(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              addText('$title :', getSmallTextFontSIze()-1, ColorConstants.black,
                  FontWeight.normal),
              addText(' $description', getSmallTextFontSIze()-1,
                  ColorConstants.primaryColor, FontWeight.bold),
            ],
          ),
          SizedBox(
            height: 1.h,
          )
        ],
      ),
    );
  }


}
