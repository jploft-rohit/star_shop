import 'package:animate_do/animate_do.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/news/news_details_screen.dart';
import 'package:star_shop/common/app_header.dart';

import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/news_controller.dart';


class NewsView extends GetView<NewsController>{
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'News',
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: addText('Latest Broadcasts & Events', getHeadingTextFontSIze(), ColorConstants.amberBlack, FontWeight.bold),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: getBorderRadius(),
                border: Border.all(color: ColorConstants.borderColor),
                color: ColorConstants.primaryColorLight),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: buildSchoolDropDown(),
          ),
          SizedBox(
            height: 2.h,
          ),

          Expanded(child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return buildNewsItem(index);
            },
          ))


        ],
      ),
    );
  }

  Widget buildSchoolDropDown() {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: controller.schoolItems
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: getNormalTextFontSIze(),
                fontWeight: FontWeight.normal,
                color: ColorConstants.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value: controller.selectedSchool.value,
          onChanged: (value) {
            controller.selectedSchool.value = value.toString();
          },
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            size: getLargeTextFontSIze() * 1.5,
            color: ColorConstants.lightTextColor,
          ),
          iconSize: 14,
          iconEnabledColor: ColorConstants.gretTextColor,
          iconDisabledColor: Colors.grey,
          buttonWidth: 80.w,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 78.w,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          dropdownElevation: 1,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          // offset: const Offset(-20, 0),
        ),
      )),
    );
  }

  Widget buildNewsItem(int index){
    return FadeInRight(
      duration: Duration(milliseconds: 200*(index+1)),
      child: GestureDetector(
        onTap: (){
         Get.to(const NewsDetailScreen());
        },
        child: Container(
          width: 100.w,
          margin:  EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
          decoration: BoxDecoration(
              color: index.isEven ? const Color(0xffF5F5F5) : ColorConstants.primaryColorLight,
              boxShadow: [getBoxShadow()],
              borderRadius: getCurvedBorderRadius()),
          child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText('Principal’s Honouring Ceremony', getSubheadingTextFontSIze(),  ColorConstants.amberBlack, FontWeight.normal),
                  SizedBox(height: 2.h,),
                  addText('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam...', getSmallTextFontSIze(),  ColorConstants.amberBlack.withOpacity(0.6), FontWeight.normal),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      addText('School Admin', getSmallTextFontSIze(), ColorConstants.amberBlack.withOpacity(0.4), FontWeight.normal),
                      const SizedBox(width: 25,),
                      addText('15 mins ago', getSmallTextFontSIze(), ColorConstants.amberBlack.withOpacity(0.4), FontWeight.normal),
                    ],
                  ),
                  SizedBox(height: 2.h,),

                  if(index == 0)
                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
                            decoration: getEditTextDecoration(),
                            child: Center(
                              child: addText('ACKNOWLEDGE', getNormalTextFontSIze(),
                                  ColorConstants.borderColor, FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),

                  if(index != 0)
                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
                            decoration: BoxDecoration(
                                color: ColorConstants.primaryColorLight,
                                boxShadow: [getDeepBoxShadow()],
                                border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
                                borderRadius: getBorderRadius()),
                            child: Center(
                              child: addText('AGREED', getNormalTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    )

                ],
              )
          ),
        ),
      ),
    );
  }

}