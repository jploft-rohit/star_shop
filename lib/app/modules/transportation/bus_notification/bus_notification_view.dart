import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/success_dialog.dart';

import '../../../../common/app_header.dart';
import '../../../../common/bordered_button.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';
import '../../../controller/transportation/transportation_controller.dart';

class BusNotificationView extends GetView<TransportationController>{
  const BusNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Bus Arriving Soon',
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              addAlignedText('Please make sure you are ready at the pickup point.', getHeadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 5.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: addText('Notify :', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.bold),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(() => ListView.builder(
                itemCount: controller.busNotificationList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.selectedBusNotificationPos.value = index;
                    },
                    child: Container(
                      height: 6.h,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorConstants.primaryColor),
                          borderRadius: getBorderRadius()),
                      padding:  EdgeInsets.all(1.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addText(
                              controller.busNotificationList[index],
                              getNormalTextFontSIze(),
                              ColorConstants.primaryColor,
                              FontWeight.normal),

                          Obx(() => controller.selectedBusNotificationPos.value == index ? Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConstants.primaryColor,
                                boxShadow: [getDeepBoxShadow()],
                                border: Border.all(
                                    color: ColorConstants.white, width: 2)),
                            child: const Icon(
                              Icons.check,
                              color: ColorConstants.white,
                              size: 15,
                            ),
                          ) : const SizedBox.shrink())

                        ],
                      ),
                    ),
                  );
                },
              )),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: (){
                  Get.dialog(const SuccessDialog(message: 'Driver Successfully Notified'));
                },
                child: BorderedButton(width: 2, text: 'NOTIFY'),
              )
            ],
          ),
        ),
      ),
    );
  }

}