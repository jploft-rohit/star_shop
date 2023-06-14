import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/notification_controller.dart';
import 'package:star_shop/common/bordered_button.dart';

import '../../../../common/color_constants.dart';
import '../../../../common/edgy_bordered_button.dart';
import '../../../../common/utils.dart';

class LateToPrepareDialog extends GetView<NotificationController> {
  const LateToPrepareDialog({super.key});

  @override
  Widget build(BuildContext context) {

    Get.lazyPut(()=>NotificationController());

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
                  const SizedBox(
                    width: 10,
                  ),
                  addText('Late to Prepare', getSubheadingTextFontSIze(),
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
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      addText('Hours', getSmallTextFontSIze() + 1,
                          ColorConstants.black, FontWeight.w500),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 15.w,
                        height: 15.w,
                        decoration: BoxDecoration(
                            borderRadius: getBorderRadius(),
                            border:
                                Border.all(color: ColorConstants.primaryColor),
                            color:
                                ColorConstants.primaryColor.withOpacity(0.3)),
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            cursorColor: ColorConstants.primaryColor,
                            keyboardType: TextInputType.multiline,
                            controller: controller.lateHoursController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                fontSize: getLargeTextFontSIze(),
                                color: ColorConstants.primaryColor),
                            decoration: InputDecoration(
                                hintText: '00',
                                hintStyle: TextStyle(
                                    fontSize: getLargeTextFontSIze(),
                                    color: ColorConstants.primaryColor),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: getSmallTextFontSIze() + 1),
                      child: addText(':', getLargeTextFontSIze(),
                          ColorConstants.primaryColor, FontWeight.bold)),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      addText('Minutes', getSmallTextFontSIze() + 1,
                          ColorConstants.black, FontWeight.w500),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 15.w,
                        height: 15.w,
                        decoration: BoxDecoration(
                            borderRadius: getBorderRadius(),
                            border:
                                Border.all(color: ColorConstants.primaryColor),
                            color:
                                ColorConstants.primaryColor.withOpacity(0.3)),
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            cursorColor: ColorConstants.primaryColor,
                            keyboardType: TextInputType.multiline,
                            controller: controller.lateMinutesController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                fontSize: getLargeTextFontSIze(),
                                color: ColorConstants.primaryColor),
                            decoration: InputDecoration(
                                hintText: '00',
                                hintStyle: TextStyle(
                                    fontSize: getLargeTextFontSIze(),
                                    color: ColorConstants.primaryColor),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: BorderedButton(
                    width: 0, text: 'SUBMIT', borderRadius: getBorderRadius()),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
