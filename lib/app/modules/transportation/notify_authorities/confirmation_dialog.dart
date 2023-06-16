import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/transportation/notify_authorities_controller.dart';

import '../../../../common/circular_bordered_button.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';

class AuthorityConfirmationDialog extends GetView<NotifyAuthoritiesController>{
  const AuthorityConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: addAlignedText('Are you sure you want to notify authorities?', getSubheadingTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: ColorConstants.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),

              ListView.builder(
                itemCount: controller.selectedReasonList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildOwnVehicle(context,index);
                },
              ),


              
              SizedBox(
                height: 1.h,
              ),

              GestureDetector(
                onTap: () {},
                child: CircularBorderedButton(width: 40.w, text: 'NOTIFY'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget buildOwnVehicle(BuildContext context,int index){
    return Column(
      children: [
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
            color: ColorConstants.primaryColorLight,
            borderRadius: getEdgyBorderRadius()
          ),
          child: addText(controller.selectedReasonList[index], getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          height: 5.h,
          child: Obx(() => ListView.builder(
            itemCount: controller.daysList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, innerIndex) {
              return Container(
                margin: EdgeInsets.only(right: 5.w),
                child: Obx(() => GestureDetector(
                  onTap: () {
                    controller.selectedDaysPosList[index] = innerIndex;
                  },
                  child: Row(
                    children: [
                      Obx(() => Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: controller.selectedDaysPosList[innerIndex] == innerIndex ? ColorConstants.primaryColor : ColorConstants.lightGreyColor,
                            color: controller.selectedDaysPosList[index] == innerIndex ? ColorConstants.primaryColor : ColorConstants.lightGreyColor,
                            boxShadow: [getDeepBoxShadow()],
                            border: Border.all(color: ColorConstants.white,width: 2)
                        ),child: const Icon(Icons.check,color: ColorConstants.white,size: 15,),
                      )),
                      const SizedBox(width: 10,),
                        addText(controller.daysList[innerIndex], getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal)


                    ],
                  ),
                )),
              );
            },
          )),
        ),
        Obx(() =>
          Visibility(
            visible: controller.selectedDaysPosList[index]==1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText('From', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                      SizedBox(height: 0.3.h,),
                      Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 13),
                      decoration: getEditTextDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          addText('dd/mm/yyyy', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                          GestureDetector(
                              onTap: ()=>showPicker(context),
                              child: SvgPicture.asset('assets/images/fab_calendar.svg',height: getHeadingTextFontSIze(),color: ColorConstants.black,)),
                        ],
                      ),
          ),
                    ],
                  ),
                ),
                SizedBox(width: 1.h,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText('To', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                      SizedBox(height: 0.3.h,),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 13),
                        decoration: getEditTextDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            addText('dd/mm/yyyy', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                            GestureDetector(
                                onTap: ()=>showPicker(context),
                                child: SvgPicture.asset('assets/images/fab_calendar.svg',height: getHeadingTextFontSIze(),color: ColorConstants.black,)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),)
        ),




        const SizedBox(height: 10,),
      ],
    );
  }

}