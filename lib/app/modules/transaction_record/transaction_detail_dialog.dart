import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/transaction_record_controller.dart';
import 'package:star_shop/common/circular_bordered_button.dart';

import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../rating/star_rating_dialog.dart';

class TransactionDetailDialog extends GetView<TransactionRecordController>{
  const TransactionDetailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
          const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 20),
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        color: Colors.transparent,
                      ),
                    ),
                    addText('Transaction Details', getSubheadingTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        color: ColorConstants.borderColor,
                      ),
                    )
                  ],
                ),
              ),





              SizedBox(
                height: 2.h,
              ),


              Stack(
                children: [

                  GestureDetector (
                    onTap: (){
                      // showTransactionDetailsDialog();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      decoration: BoxDecoration(
                          color: ColorConstants.white,
                          borderRadius: getCustomBorderRadius(15),
                          border: Border.all(color: ColorConstants.borderColor)
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                               Column(
                                 children: [

                                   Container(
                                     width: getLargeTextFontSIze()*2.5,
                                     height: getLargeTextFontSIze()*2.5,
                                     padding: const EdgeInsets.all(5),
                                     decoration: BoxDecoration(
                                         color: ColorConstants.white,
                                         borderRadius: getCustomBorderRadius(15),
                                         border: Border.all(color: ColorConstants.primaryColor)
                                     ), child: SvgPicture.asset('assets/images/student.svg',height: getLargeTextFontSIze()*2,),
                                   ),
                                   const SizedBox(height: 10,),
                                   addText('#632541', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold)


                                 ],
                               ),
                                SizedBox(width: 3.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    addText('Zoya', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                                    const SizedBox(height: 3,),
                                    addText('Order ID : #632541', getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal),
                                    const SizedBox(height: 3,),
                                    addText('TR No : #632541', getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal),
                                    const SizedBox(height: 3,),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Purchase ".tr,
                                              style: TextStyle(
                                                fontFamily: 'Ariel',
                                                fontSize: getNormalTextFontSIze(),
                                                color: ColorConstants.black,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          TextSpan(
                                            text: "(Cookies)".tr,
                                            style: TextStyle(
                                              fontFamily: 'Ariel',
                                              fontSize: getSmallestTextFontSIze(),
                                              color: ColorConstants.black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "2 AED ".tr,
                                              style: TextStyle(
                                                fontFamily: 'Ariel',
                                                fontSize: getNormalTextFontSIze(),
                                                color: ColorConstants.black,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          TextSpan(
                                            text: "Received".tr,
                                            style: TextStyle(
                                              fontFamily: 'Ariel',
                                              fontSize: getSmallestTextFontSIze(),
                                              color: ColorConstants.blue,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    addText('20/10/2022', getSmallTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                                    const SizedBox(height: 5,),
                                    addText('09:00:30pm', getSmallTextFontSIze()-1, ColorConstants.gretTextColor, FontWeight.normal),
                                    SizedBox(height: 3.h,),

                                  ],
                                ),
                                SizedBox(width: 5.w,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),



                  Positioned(
                      top: 0,
                      bottom: 0,
                      right: 5,
                      child: GestureDetector(
                        onTap: (){
                          Get.dialog(StarRatingDialog());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [getDeepBoxShadow()],
                              color: ColorConstants.white
                          ),
                          child: SvgPicture.asset('assets/images/star.svg'),
                        ),
                      ))





                ],
              ),





              SizedBox(
                height: 2.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){},
                    child: CircularBorderedButton(width: 38.w, text: 'PRINT RECEIPT'),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: CircularBorderedButton(width: 38.w, text: 'SAVE RECEIPT'),
                  ),
                  SizedBox(width: 5,),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

}