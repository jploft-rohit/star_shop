import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../common/circular_bordered_button.dart';
import '../../../../../common/color_constants.dart';
import '../../../../../common/utils.dart';
import '../../../../controller/purchase_controller.dart';


class TransactionDetailDialog extends GetView<PurchaseController>{
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
              SizedBox(
                height: 2.h,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ClipRRect(
                    //   borderRadius: getBorderRadius(),
                    //   child: Image.network('https://picsum.photos/200',height: getLargeTextFontSIze()*2,),
                    // ),
                    ClipRRect(
                      borderRadius: getBorderRadius(),
                      child: Image.asset('assets/images/im_canteen_01.png',height: getLargeTextFontSIze()*2,),
                    ),
                    SizedBox(width: 3.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                text: "sent".tr,
                                style: TextStyle(
                                  fontFamily: 'Ariel',
                                  fontSize: getSmallestTextFontSIze(),
                                  color: ColorConstants.blue,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2,),
                        addText('TR No : 2587961', getSmallestTextFontSIze(), ColorConstants.black, FontWeight.normal)
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addText('20/10/2022', getSmallTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                        addText('09:00:30pm', getSmallTextFontSIze()-1, ColorConstants.gretTextColor, FontWeight.normal),


                      ],
                    )

                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              Row(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: CircularBorderedButton(width: 50.w, text: 'PRINT RECEIPT'),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: CircularBorderedButton(width: 50.w, text: 'SAVE RECEIPT'),
                  ),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

}