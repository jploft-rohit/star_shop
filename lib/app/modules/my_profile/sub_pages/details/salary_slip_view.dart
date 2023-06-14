import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../common/app_header.dart';
import '../../../../../common/color_constants.dart';
import '../../../../../common/utils.dart';
import '../../../../controller/salary_slip_controller.dart';


class SalarySlipView extends GetView<SalaryClipController>{
  const SalarySlipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Salary Slip',
          )),
      body: ListView.builder(
        itemCount: 12,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return buildSalarySlipItem(index,context);
        },
      ),
    );
  }

  Widget buildSalarySlipItem(int index,BuildContext context){
    return Container(
      width: 100.w,
      margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
      decoration: BoxDecoration(
        boxShadow: [getDeepBoxShadow()],
        borderRadius: getBorderRadius(),
        color: ColorConstants.white,
        border: Border.all(color: ColorConstants.borderColor2)
      ), child: Row(
      children: [
        Container(
          width: 20.w,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              borderRadius: getBorderRadius(),
              border: Border.all(color: ColorConstants.primaryColor),
            color: ColorConstants.primaryColorLight
          ), child: Column(
          children: [
            addText('10', getLargeTextFontSIze()-2, ColorConstants.primaryColor, FontWeight.bold),
            addText('September', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
          ],
        ),
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            addText('Payment Received', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
            const SizedBox(height: 5,),
            addText('1000 AED', getNormalTextFontSIze() , ColorConstants.primaryColor, FontWeight.bold),
          ],
        ),
        const Spacer(),
        Row(
          children:  [
            GestureDetector(
              onTap: (){},
              child: const Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,),
            ),
            const SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                showSalarySlipView(context, index);
              },
              child: const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,),
            ),

          ],
        ),
        const SizedBox(width: 10,),


      ],
    ),
    );
  }


  showSalarySlipView(BuildContext context,int index){

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
            backgroundColor: ColorConstants.white,
            elevation: 10,

            scrollable: true,
            title: Stack(
              children: [
                Align(alignment: Alignment.center,
                  child: addAlignedText(
                      "Pay Slip of July",
                      getHeadingTextFontSIze(),
                      ColorConstants.black,
                      FontWeight.w600),),

                Align(alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: ColorConstants.borderColor,
                      )


                    ))
              ],
            ),
            contentPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: getCurvedBorderRadius()),
            content: SizedBox(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h,),
                    Image.asset('assets/images/pdf.png',color: ColorConstants.lightGreyColor,),
                    SizedBox(height: 2.h,),
                    addText('12/07/2022', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                    SizedBox(height: 5.h,),
                  ],
                ),
              ),
            )));


  }



}