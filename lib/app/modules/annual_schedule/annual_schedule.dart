import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/home_controller.dart';
import 'package:star_shop/app/modules/annual_schedule/view_calendar.dart';
import 'package:star_shop/common/app_header.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/utils.dart';



class AnnualScheduleScreen extends StatefulWidget {
  const AnnualScheduleScreen({Key? key}) : super(key: key);

  @override
  State<AnnualScheduleScreen> createState() => _AnnualScheduleScreenState();
}

class _AnnualScheduleScreenState extends State<AnnualScheduleScreen>{
  int selectedIndex = 0;
  var tabListItems = ["Holidays", "Exams"];
  @override
  void initState() {
    super.initState();
  }
  String? initialSchool;
  final Color greenBG = const Color(0xffE7FCE9);
  final Color blueBG = const Color(0xffEDF5FD);
  final Color orangeBG = const Color(0xffFFF0E1);
  final Color greenICON = const Color(0xff19AD54);
  final Color blueICON = const Color(0xff5675B1);
  final Color orangeICON = const Color(0xffE29249);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Annual Schedule',
          )),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor),
                  color: ColorConstants.primaryColorLight),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: buildSchoolDropDown(Get.find<HomeController>().schoolItems, Get.find<HomeController>().selectedSchool, 'Hint', 100.w),
            ),
            SizedBox(
              height: 2.h,
            ),
            buildTabs(),
            // BaseToggleTabBar(
            //     controller: tabController, tabs: [
            //   BaseTabButton(title: 'Holidays', isSelected: tabController.index==0,type: toggleLargeButton,),
            //   BaseTabButton(title: 'Exams', isSelected: tabController.index==1,type: toggleLargeButton,),
            // ]),
            SizedBox(height: 1.5.h,),
            Expanded(child: selectedIndex==0?SingleChildScrollView(
              child: Column(
                children: [
                  card(
                      icon: 'summer',
                      bg: greenBG,
                      iconColor: greenICON,
                      title: 'Summer Vacations',
                      time: 'June 15 to July 15',
                      context: context
                  ),
                  card(
                      icon: 'winter',
                      bg: blueBG,
                      iconColor: blueICON,
                      title: 'Winter Vacations',
                      time: 'January 10 to February 10',
                      context: context
                  ),
                  card(
                      icon: 'party',
                      bg: blueBG,
                      iconColor: blueICON,
                      title: 'New Year’s Day',
                      time: 'January 1',
                      context: context
                  ),
                  card(
                      icon: 'eid',
                      bg: greenBG,
                      iconColor: greenICON,
                      title: 'Eid al Fitr',
                      time: 'April 20, 21, 22 and 23',
                      context: context
                  ),
                  card(
                      icon: 'arafat',
                      bg: orangeBG,
                      iconColor: orangeICON,
                      title: 'Arafat Day',
                      time: 'June 27',
                      context: context
                  ),
                  card(
                      icon: 'eid',
                      bg: orangeBG,
                      iconColor: orangeICON,
                      title: 'June 28, 29, 3',
                      time: 'Eid al Adha',
                      context: context
                  ),
                  card(
                      icon: 'party',
                      bg: blueBG,
                      iconColor: blueICON,
                      title: 'July 19',
                      time: 'Islamic New Year',
                      context: context
                  ),
                  card(
                      icon: 'birthday',
                      bg: greenBG,
                      iconColor: greenICON,
                      title: 'September 27',
                      time: 'The Prophet Muhammad’s (PBUH) birthday',
                      context: context
                  ),
                  card(
                      icon: 'commemoration',
                      bg: orangeBG,
                      iconColor: orangeICON,
                      title: 'December 1',
                      time: 'Commemoration Day',
                      context: context
                  ),
                  card(
                      icon: 'national',
                      bg: orangeBG,
                      iconColor: orangeICON,
                      title: 'December 2, 3',
                      time: 'National Day',
                      context: context
                  ),
                ],
              ),
            ):
                SingleChildScrollView(
                  child: Column(
                    children: [
                      card(
                          icon: 'file',
                          bg: greenBG,
                          iconColor: greenICON,
                          title: 'Term 1',
                          time: 'January 01 to January 08',
                          context: context
                      ),
                      card(
                          icon: 'file',
                          bg: blueBG,
                          iconColor: blueICON,
                          title: 'Term 2',
                          time: 'March 01 to March 08',
                          context: context
                      ),
                      card(
                          icon: 'file',
                          bg: blueBG,
                          iconColor: blueICON,
                          title: 'Half Yearly',
                          time: 'June 15 to July 15',
                          context: context
                      ),
                      card(
                          icon: 'file',
                          bg: greenBG,
                          iconColor: greenICON,
                          title: 'Term 3',
                          time: 'September 01 to September 08',
                          context: context
                      ),
                      card(
                          icon: 'file',
                          bg: blueBG,
                          iconColor: blueICON,
                          title: 'Term 4',
                          time: 'November 01 to November 08',
                          context: context
                      ),
                      card(
                          icon: 'file',
                          bg: greenBG,
                          iconColor: greenICON,
                          title: 'Annual Exam',
                          time: 'December 20 to December 30',
                          context: context
                      ),
                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
  Widget buildTabs(){
    return  SizedBox(
      height: 5.h,
      child: Center(
        child: ListView.builder(
          itemCount: tabListItems.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                setState(() {
                  selectedIndex=index;
                });

              },
              child: Container(
                  width: 50.w-27,
                  margin:  EdgeInsets.only(top: 0.5.h,bottom: 0.5.h,right: 10,left: 1),
                  // padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: selectedIndex == index ? ColorConstants.primaryColorLight : ColorConstants.white,
                      boxShadow: [getBoxShadow()],
                      borderRadius: getBorderRadius()),
                  child: Center(child: addText(tabListItems[index], getNormalTextFontSIze(), selectedIndex == index ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.bold)),
                ),
            );
          },
        ),
      ),
    );
  }
}
Widget card({
  required String icon,
  required Color bg,
  required Color iconColor,
  required String title,
  required String time,
  required BuildContext context,
bool isNextSCreen = true
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: GestureDetector(
      onTap: () {
        if(isNextSCreen)
          {
            Get.to(AnnualViewCalendarScreen(title: title, icon: icon, time: time, bg: bg, iconColor: iconColor));
          }
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: SvgPicture.asset(
                  'assets/images/$icon.svg',
                  height: 15,
                  width: 15,
                  color: iconColor,
                ),
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText(
                    title,
                    17.sp,
                    Colors.black,
                    FontWeight.bold,
                  ),
                  Spacer(),
                  addText(
                    time,
                    15.sp,
                    Colors.black.withOpacity(0.6),
                    FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );

}



