import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/my_profile/sub_pages/account/account_view.dart';
import 'package:star_shop/app/modules/my_profile/sub_pages/details/profile_details.dart';
import 'package:star_shop/app/modules/my_profile/sub_pages/schools/school_view.dart';
import 'package:star_shop/app/modules/my_profile/sub_pages/staff/staff_view.dart';
import 'package:star_shop/common/base_tab_bar.dart';

import '../../../common/app_header.dart';
import '../../../common/circular_bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/print_qr_dialog.dart';
import '../../../common/utils.dart';
import '../../controller/my_profile_controller.dart';
import '../../routes/app_routes.dart';


class MyProfileView extends GetView<MyProfileController>{
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(5.h), child:  const AppHeader(showBackIcon: false, title: 'My Profile',)),
      body: Container(
        width: 100.w,
        margin:  EdgeInsets.only(left: 15,right: 15,bottom: 8.5.h),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: getCurvedBorderRadius(),
          border: Border.all(color: ColorConstants.lightGreyColor),
          boxShadow: [getLightBoxShadow()],
        ),child:
      Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 8,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: getBorderRadius(),
                border: Border.all(color: ColorConstants.primaryColor),
                color: ColorConstants.primaryColorLight
              ),
              child: ClipRRect(
                borderRadius: getBorderRadius(),
                child: const LinearProgressIndicator(
                  value: 0.5,
                  valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.primaryColor),
                  backgroundColor: ColorConstants.primaryColorLight,
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText('Profile Complete 50%', getSmallTextFontSIze()-1, ColorConstants.primaryColor, FontWeight.w500),
                  addText('Complete Your Profile Till: 25 July, 2022', getSmallTextFontSIze()-1, Colors.redAccent, FontWeight.w500),

                ],
              ),
            ),
            SizedBox(height: 3.h,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                      borderRadius: getCurvedBorderRadius(),
                      border: Border.all(color: ColorConstants.primaryColor),
                    ),
                    child: SvgPicture.asset('assets/images/user.svg',height: getLargeTextFontSIze()*2,),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        addText('Rafiq Khan', getHeadingTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                        const SizedBox(height: 5,),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Designation ".tr,
                                  style: TextStyle(
                                    fontFamily: 'Ariel',
                                    fontSize: getSmallTextFontSIze(),
                                    color: ColorConstants.black,
                                    fontWeight: FontWeight.w500,
                                  )),
                              TextSpan(
                                text: ": Canteen Admin".tr,
                                style: TextStyle(
                                  fontFamily: 'Ariel',
                                  fontSize: getSmallTextFontSIze(),
                                  color: ColorConstants.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                  Column(
                    children: [

                      // GestureDetector(
                      //   onTap: (){
                      //     Get.toNamed(Routes.deactivationDetails);
                      //   }, child: Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                      //   decoration: BoxDecoration(
                      //       borderRadius: getCurvedBorderRadius(),
                      //       border: Border.all(color: ColorConstants.primaryColor),
                      //       color: ColorConstants.primaryColorLight),
                      //   child: addText('DEACTIVATED', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
                      // ),
                      // ),
                      // SizedBox(height: 1.h,),
                      GestureDetector(
                        onTap: (){
                          showQrDialog();
                        }, child: SvgPicture.asset('assets/images/qrcode.svg'),
                      )

                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 GestureDetector(
                   onTap: (){
                     Get.to(const PrintQrDialog());
                   },
                   child: CircularBorderedButton(width: 35.w, text: 'PRINT QR',),
                 ),
                 const SizedBox(width: 5,),
                 GestureDetector(
                   onTap: (){
                     showProgramNFCDialogue(context);
                   },
                   child: CircularBorderedButton(width: 45.w, text: 'PROGRAMME NFC',),
                 )
               ],
           ),
            ),
            SizedBox(height: 2.h,),

            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: BaseTabBar(tabController: controller.controller,tabList: [
                  Tab(
                    text: 'Account'.tr,
                  ),
                  Tab(
                    text: 'Details'.tr,
                  ),
                  Tab(
                    text: 'Schools'.tr,
                  ),
                  Tab(
                    text: 'Staff'.tr,
                  ),
                ])),
            SizedBox(height: 2.h,),
            Expanded(
              child: TabBarView(
                controller: controller.controller,
                children: const [
                  AccountView(),
                  ProfileDetails(),
                  SchoolView(),
                  ProfileStaffView(),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }

}