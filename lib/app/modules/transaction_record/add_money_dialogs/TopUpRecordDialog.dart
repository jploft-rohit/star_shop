import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/circular_bordered_button.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';

class TopUpRecordDialog extends StatefulWidget {
  const TopUpRecordDialog({Key? key}) : super(key: key);

  @override
  State<TopUpRecordDialog> createState() => _TopUpRecordDialogState();
}

class _TopUpRecordDialogState extends State<TopUpRecordDialog> {
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
                    addText('Transaction History', getSubheadingTextFontSIze(),
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


              Container(

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
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: BoxDecoration(
                                color: ColorConstants.primaryColorLight,
                                border: Border.all(color: ColorConstants.primaryColor),
                                borderRadius: getCustomBorderRadius(15)
                            ), child: Column(
                            children: [

                              addText('100', getLargeTextFontSIze(), ColorConstants.primaryColor, FontWeight.w900),
                              addText('AED', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),

                            ],
                          ),
                          ),
                          SizedBox(width: 3.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              addText('Amount Added', getSubheadingTextFontSIze(), ColorConstants.black, FontWeight.w500),
                              const SizedBox(height: 5,),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "TR No : ".tr,
                                        style: TextStyle(
                                          fontFamily: 'Ariel',
                                          fontSize: getNormalTextFontSIze(),
                                          color: ColorConstants.black,
                                          fontWeight: FontWeight.normal,
                                        )),
                                    TextSpan(
                                      text: "263484".tr,
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

                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              addText('20/10/2022', getSmallTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                              const SizedBox(height: 5,),
                              addText('09:00:30pm', getSmallTextFontSIze()-1, ColorConstants.gretTextColor, FontWeight.normal),
                            ],
                          ),
                          SizedBox(width: 5.w,),

                        ],
                      ),
                    ),
                  ],
                ),
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
