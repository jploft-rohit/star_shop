import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/notification_controller.dart';
import 'package:star_shop/app/modules/notifications/dialogs/late_to_prepare.dart';

import '../../../../common/color_constants.dart';
import '../../../../common/edgy_bordered_button.dart';
import '../../../../common/utils.dart';

class OrderReceivedDialog extends GetView<NotificationController>{
  const OrderReceivedDialog({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10,),
                  addText('Order Received', getSubheadingTextFontSIze(),
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
              addText('User', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor2)
                ), child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.primaryColor),
                      borderRadius: getCurvedBorderRadius()
                    ), child: SvgPicture.asset('assets/images/user.svg',height: 6.h,),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      addText('Romaan (Star)', getSubheadingTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                      SizedBox(height: 1.h,),
                      // buildInfoItems('ID', '#428746354'),
                      Row(
                        children: [
                          addText('ID :', getSmallTextFontSIze() + 1, ColorConstants.black,
                              FontWeight.bold),
                          addText(' #428746354', getSmallTextFontSIze() + 1,
                              ColorConstants.primaryColor, FontWeight.bold),
                        ],
                      ),

                    ],
                  ),
                ],
              ),

              ),

              SizedBox(
                height: 2.h,
              ),
              addText('Order', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    // border: Border.all(color: ColorConstants.borderColor2)
                    color: ColorConstants.white,
                  boxShadow: [getDeepBoxShadow()]
                ), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoItems('Order ID', '#568414'),
                  buildInfoItems('Order Total', '42 AED'),
                  buildInfoItems('Items', '4'),
                  buildInfoItems('Order Date', '01/08/2023'),
                  buildInfoItems('Serving Place', 'Canteen'),
                ],
              ),

              ),

              SizedBox(
                height: 2.h,
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                        showToast('Request Submitted');
                      },
                      child: EdgyBorderedButton(width: 35.w, text: 'ACCEPT'),
                    ),
                  ),

                  const SizedBox(width: 10,),

                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        // Get.back();
                        Get.dialog(const LateToPrepareDialog());
                      },
                      child: EdgyBorderedButton(width: 43.w, text: 'LATE TO PREPARE'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}