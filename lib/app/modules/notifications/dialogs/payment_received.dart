import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/notification_controller.dart';

import '../../../../common/color_constants.dart';
import '../../../../common/edgy_bordered_button.dart';
import '../../../../common/utils.dart';

class PaymentReceivedDialog extends GetView<NotificationController>{
  const PaymentReceivedDialog({super.key});

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
                  addText('Payment Received', getSubheadingTextFontSIze(),
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
                      buildInfoItems('ID', '#428746354')

                    ],
                  ),
                ],
              ),

              ),

              SizedBox(
                height: 2.h,
              ),

              buildInfo(),

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
                      child: EdgyBorderedButton(width: 43.w, text: 'DIFFERENT USER'),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                        showToast('Request Submitted');
                      },
                      child: EdgyBorderedButton(width: 35.w, text: 'CONFIRM'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfo(){
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              text: "Payment of ".tr,
              style: TextStyle(
                fontFamily: 'Ariel',
                fontSize: getNormalTextFontSIze(),
                color: ColorConstants.black,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
            text: " 230 AED ".tr,
            style: TextStyle(
              fontFamily: 'Ariel',
              fontSize: getNormalTextFontSIze(),
              color: ColorConstants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
              text: "Received on Order Id".tr,
              style: TextStyle(
                fontFamily: 'Ariel',
                fontSize: getNormalTextFontSIze(),
                color: ColorConstants.black,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
            text: " #67788".tr,
            style: TextStyle(
              fontFamily: 'Ariel',
              fontSize: getNormalTextFontSIze(),
              color: ColorConstants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

}