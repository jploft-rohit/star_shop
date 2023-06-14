import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/bottom_app_bar/curved_navigation_bar.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/base_controller.dart';
import '../home/home_view.dart';
import '../my_profile/my_profile_view.dart';
import '../pre_orders/pre_order_base_view.dart';
import '../search/search_view.dart';


class BaseView extends GetView<BaseController>{
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorConstants.primaryColor,


      // bottomNavigationBar: CurvedNavigationBar(
      //   key: controller.bottomNavigationKey,
      //   buttonBackgroundColor: ColorConstants.primaryColorLight,
      //   height: 8.h,
      //   backgroundColor: Colors.transparent.withOpacity(0),
      //   index: 2,
      //   color: ColorConstants.primaryColorLight,
      //   items: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: SvgPicture.asset(
      //         'assets/images/nav_cashier.svg',
      //         width: 25,
      //         height: 25,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: SvgPicture.asset(
      //         'assets/images/nav_search.svg',
      //         width: 25,
      //         height: 25,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: SvgPicture.asset(
      //         'assets/images/app_logo2.svg',
      //         width: 25,
      //         height: 25,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: SvgPicture.asset(
      //         'assets/images/nav_role.svg',
      //         width: 25,
      //         height: 25,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: SvgPicture.asset(
      //         'assets/images/nav_account.svg',
      //         width: 25,
      //         height: 25,
      //       ),
      //     ),
      //   ],
      //   onTap: (index) {
      //     controller.currentIndex.value = index;
      //   },
      //   titles: const [
      //     'Cashier','Search','Home','Role','Account'
      // ],
      // ),


      bottomNavigationBar:  Stack(
        alignment: Alignment.center,
        children: [
          CurvedNavigationBar(
            key: controller.bottomNavigationKey,
            buttonBackgroundColor: ColorConstants.primaryColorLight,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeOut,
            index: 1,
            color: ColorConstants.primaryColorLight,
            height: GetPlatform.isIOS ? 85.0 : 75.0,
            items: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 11),
              //   child: SvgPicture.asset(
              //     'assets/images/nav_cashier.svg',
              //     width: 25,
              //     height: 25,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/nav_search.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/app_logo2.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SvgPicture.asset(
              //     'assets/images/nav_role.svg',
              //     width: 25,
              //     height: 25,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/nav_account.svg',
                  width: 25,
                  height: 25,
                ),
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          Positioned(
            bottom: (GetPlatform.isIOS?15.0:5.0),
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(width: 25.w,alignment: Alignment.center,child: addAlignedText('Pre-orders', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),),
                Container(width: 33.3.w,alignment: Alignment.center,child: addAlignedText('Search', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),),
                Container(width: 33.w,alignment: Alignment.center,child: addAlignedText('Home', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),),
                Container(width: 33.w,alignment: Alignment.center,child: addAlignedText('Account', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),),
              ]
            ),
          )
        ],
      ),









      body: Obx(() => buildPages()),
    );
  }



  // Widget buildPages() {
  //   switch (controller.currentIndex.value) {
  //     case 0:
  //       return const PreOrdersBaseView();
  //     case 1:
  //       return const SearchView();
  //     case 2:
  //       return const HomeView();
  //     case 3:
  //       return const MyProfileView();
  //     case 4:
  //       return const MyProfileView();
  //     default:
  //       return const HomeView();
  //   }
  // }


  Widget buildPages() {
    switch (controller.currentIndex.value) {
      case 0:
        return const SearchView();
      case 1:
        return const HomeView();
      case 2:
        return const MyProfileView();
      default:
        return const HomeView();
    }
  }


}