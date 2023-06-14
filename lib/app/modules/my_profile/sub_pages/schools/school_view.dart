import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/my_profile_controller.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/direction_view.dart';
import 'package:star_shop/common/utils.dart';

class SchoolView extends GetView<MyProfileController>{
  const SchoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Number of located school : ".tr,
                        style: TextStyle(
                          fontFamily: 'Ariel',
                          fontSize: getNormalTextFontSIze(),
                          color: ColorConstants.black,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                      text: "3".tr,
                      style: TextStyle(
                        fontFamily: 'Ariel',
                        fontSize: getNormalTextFontSIze(),
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              ListView.builder(
                itemCount: 12,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildSchoolItem(index, context);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildSchoolItem(int index,BuildContext context){
    return  Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: getCurvedBorderRadius(),
          side: const BorderSide(color: ColorConstants.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Theme(
          data: Theme.of(context)
              .copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              iconColor: ColorConstants.primaryColor,
              collapsedIconColor: ColorConstants.primaryColor,
              tilePadding: EdgeInsets.zero,
              title: addText(
                  '${(index+1)} Ignite Group School',
                  getHeadingTextFontSIze(),
                  ColorConstants.black,
                  FontWeight.bold),
              backgroundColor: ColorConstants.white,
              children: <Widget>[
                SizedBox(height: 2.h,),
                buildInfoItems('School Name', 'Ignite Group School'),
                buildInfoItems('Staff Admin', 'Ahmed Ali'),
                buildInfoItems('School Category', 'Govt School'),
                buildInfoItems('School Type', 'PreSchool, Cycle 1, Cycle2'),
                buildInfoItems('School ID', '#4425577'),
                buildImageInfoItems('School Address', 'Located in Al War 3','assets/images/ic_map.svg'),
                buildInfoItems('School Sector', 'Dubai'),
                buildInfoItems('School Area', 'Warqa 3'),
                buildInfoItems('School Email', 'ingnitea@school.com'),
                buildInfoItems('School Contact no', '6627729988'),
                buildInfoItems('School Website', 'www.schoolwebpage.com'),
                buildBoxInfo('Week Days - 3','assets/images/fab_calendar.svg','Monday, Tuesday, Wednesday'),
                buildBoxInfo('Number of Classes Per Week','assets/images/ic_staff.svg','30'),
                buildBoxInfo('Subject','assets/images/ic_staff.svg','Maths'),
                buildBoxInfo('Slot Type','assets/images/ic_staff.svg','Double'),
                buildBoxInfo('Place of Class','assets/images/ic_staff.svg','Classroom, Computer Lab, Library'),
                buildBoxInfo('Gender','assets/images/ic_staff.svg','Boys'),
                buildBoxInfo('Grade & Class','assets/images/ic_authority.svg','G3 : H1,H2,H3,H4,H5\nG4 : H1,H2,H3,H4,H5'),
                SizedBox(height: 2.h,)
              ]),
        ),
      ),
    );
  }

  Widget buildInfoItems(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addText('$title :', getSmallTextFontSIze() + 1, ColorConstants.black,
                  FontWeight.normal),
              Expanded(
                child: addText(' $description', getSmallTextFontSIze() + 1,
                    ColorConstants.primaryColor, FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 0.5.h,
          ),
          const Divider(
            color: ColorConstants.borderColor2,
          ),
          SizedBox(
            height: 0.5.h,
          ),
        ],
      ),
    );
  }

  Widget buildImageInfoItems(String title, String description,String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addText('$title :', getSmallTextFontSIze() + 1, ColorConstants.black,
                  FontWeight.normal),
              Expanded(
                child: addText(' $description', getSmallTextFontSIze() + 1,
                    ColorConstants.primaryColor, FontWeight.bold),
              ),
              GestureDetector(
                  onTap: () => Get.to(const DirectionView()),
                  child: SvgPicture.asset(image))
            ],
          ),
          SizedBox(
            height: 0.5.h,
          ),
          const Divider(
            color: ColorConstants.borderColor2,
          ),
          SizedBox(
            height: 0.5.h,
          ),
        ],
      ),
    );
  }

  Widget buildBoxInfo(String title,String image,String description){
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: addText(title, getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold)),
        Container(
          margin: EdgeInsets.only(top: 1.h,bottom: 2.h),
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
          decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.primaryColor),
              borderRadius: getBorderRadius()
          ), child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(image,height: getHeadingTextFontSIze(),),
            const SizedBox(width: 10,),
            addText(description, getSmallTextFontSIze()+1, ColorConstants.primaryColor, FontWeight.normal)
          ],
        ),
        ),
      ],
    );
  }

}