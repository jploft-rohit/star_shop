import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/my_attendance/sub_pages/absent.dart';
import 'package:star_shop/app/modules/my_attendance/sub_pages/late.dart';
import 'package:star_shop/app/modules/my_attendance/sub_pages/present.dart';
import 'package:star_shop/common/base_tab_bar.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/custom_fab.dart';
import '../../../common/utils.dart';
import '../../controller/attendance_controller.dart';
import '../../routes/app_routes.dart';


class AttendanceView extends GetView<AttendanceController>{
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(5.h), child:  const AppHeader(showBackIcon: true, title: 'Attendance',)),
      floatingActionButton: CustomFAB(isIcon: false,svgPath: 'assets/images/fab_calendar.svg', buttonText: 'View on\nCalendar',icon: Icons.add,onButtonClicked: (){
        Get.toNamed(Routes.calendarView);
      },),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: getCurvedBorderRadius(),
                border: Border.all(color: ColorConstants.borderColor2)),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    border: Border.all(color: ColorConstants.primaryColor),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/user.svg',
                    height: getLargeTextFontSIze() * 2,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    addText('Nawaz Alam', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
                    const SizedBox(height: 4,),
                    addText('#632541', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
                    const SizedBox(height: 4,),
                    addText('Driver', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    showQrDialog();
                  }, child: SvgPicture.asset('assets/images/qrcode.svg'),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    controller.carouselController?.previousPage();
                  },
                  child: const Icon(Icons.arrow_back_ios,color: ColorConstants.primaryColor,),
                ),
                Expanded(

                  child: CarouselSlider.builder(
                    carouselController: controller.carouselController!,
                    disableGesture: true,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      child: addText(
                          'Monday, 22/05/2022',
                          getNormalTextFontSIze(),
                          ColorConstants.black,
                          FontWeight.bold),
                    ),
                    options: CarouselOptions(
                      height: getLargeTextFontSIze(),
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.carouselController?.nextPage();
                  },
                  child: const Icon(Icons.arrow_forward_ios,color: ColorConstants.primaryColor ,),
                ),

              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: BaseTabBar(
                tabController: controller.controller,
                tabList: [
              Tab(
                text: 'Present'.tr,
              ),
              Tab(
                text: 'Absent'.tr,
              ),
              Tab(
                text: 'Late'.tr,
              ),
            ]),
          ),
          SizedBox(height: 2.h,),
          Expanded(
            child: TabBarView(
              controller: controller.controller,
              children: const [
                AttendancePresent(),
                AttendanceAbsent(),
                AttendanceLate()
              ],
            ),
          )


        ],
      ),
    );
  }

}