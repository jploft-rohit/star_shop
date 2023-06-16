import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/create_order/canteen_menu_controller.dart';
import 'package:star_shop/common/circular_bordered_button.dart';

import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';

class CanteenOrderSummaryReceiptDialog extends GetView<CanteenMenuController> {
  const CanteenOrderSummaryReceiptDialog({super.key});

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
                      color: ColorConstants.white,
                    ),
                  ),
                  addText('Order Receipt', getSubheadingTextFontSIze(),
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
              Align(
                  alignment: Alignment.topLeft,
                  child: addText('Order for', getNormalTextFontSIze(),
                      ColorConstants.black, FontWeight.bold)),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.borderColor2),
                        borderRadius: getBorderRadius()),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.primaryColor),
                              borderRadius: getBorderRadius()),
                          child: SvgPicture.asset(
                            'assets/images/user.svg',
                            height: getHeadingTextFontSIze() * 2,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText(
                                  'Raseed Khan (Teacher)',
                                  getNormalTextFontSIze(),
                                  ColorConstants.black,
                                  FontWeight.bold),
                              addText('#4546634', getSmallTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.bold),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 1.h,
              ),

              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  color: ColorConstants.white,
                  boxShadow: [getDeepBoxShadow()]
                ), child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Column(
                    children: [
                      buildInfoItems('Order ID', '#42385364'),
                      buildInfoItems('Order Total', '130 AED'),
                      buildInfoItems('Total Items', '3'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                addText('Item Name', getSmallTextFontSIze() + 1, ColorConstants.black,
                                    FontWeight.normal),
                                Expanded(
                                  child: addText(' : Mango Juice, Lunch Box, Fruits', getSmallTextFontSIze() + 1,
                                      ColorConstants.primaryColor, FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            )
                          ],
                        ),
                      ),

                    ],
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.h,),
                      addText('20/10/2022', getSmallestTextFontSIze()+1, ColorConstants.gretTextColor,
                          FontWeight.normal),
                      SizedBox(height: 1.h,),
                      addText('09:00:30pm', getSmallestTextFontSIze(), ColorConstants.gretTextColor,
                          FontWeight.normal)

                    ],
                  )
                ],
              ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: CircularBorderedButton(width: 50.w, text: 'PRINT RECEIPT'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
