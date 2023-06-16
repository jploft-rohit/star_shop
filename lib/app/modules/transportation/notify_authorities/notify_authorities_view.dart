import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/transportation/notify_authorities_controller.dart';
import 'package:star_shop/app/controller/transportation/transportation_controller.dart';
import 'package:star_shop/app/modules/transportation/notify_authorities/confirmation_dialog.dart';
import 'package:star_shop/common/bordered_button.dart';

import '../../../../common/app_header.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';

class NotifyAuthoritiesView extends GetView<NotifyAuthoritiesController> {
  const NotifyAuthoritiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Notify Bus Driver',
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  border: Border.all(
                      color: ColorConstants.borderColor2, width: 1.5),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        border: Border.all(color: ColorConstants.primaryColor),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/user.svg',
                        height: getLargeTextFontSIze() * 2,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addText('Rafiq Khan', getNormalTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.bold),
                          const SizedBox(
                            height: 5,
                          ),
                          addText('#296825', getNormalTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.bold),
                          const SizedBox(
                            height: 5,
                          ),
                          addText('Security', getNormalTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.bold),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showQrDialog();
                      },
                      child: SvgPicture.asset('assets/images/qrcode.svg'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: addText('Select Your Option :', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.bold),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(() => ListView.builder(
                    itemCount: controller.reasonList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (controller.selectedReasonList
                              .contains(controller.reasonList[index])) {
                            // controller.selectedAllergyIndexes.remove(controller.allergyList[index]);
                          } else {
                            controller.selectedReasonList
                                .add(controller.reasonList[index]);
                            controller.reasonList
                                .remove(controller.reasonList[index]);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.primaryColor),
                              borderRadius: getBorderRadius()),
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              addText(
                                  controller.reasonList[index],
                                  getNormalTextFontSIze(),
                                  ColorConstants.primaryColor,
                                  FontWeight.normal),
                              const Icon(
                                Icons.arrow_forward,
                                color: ColorConstants.white,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
              Divider(
                height: 2.h,
              ),
              Obx(() => ListView.builder(
                    itemCount: controller.selectedReasonList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (controller.reasonList
                              .contains(controller.selectedReasonList[index])) {
                            // controller.selectedAllergyIndexes.remove(controller.allergyList[index]);
                          } else {
                            controller.reasonList.add(controller.selectedReasonList[index]);
                            controller.selectedReasonList.remove(controller.selectedReasonList[index]);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.primaryColor),
                              borderRadius: getBorderRadius()),
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              addText(
                                  controller.selectedReasonList[index],
                                  getNormalTextFontSIze(),
                                  ColorConstants.primaryColor,
                                  FontWeight.normal),
                              Container(
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
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ),
              SizedBox(height: 2.h),
              GestureDetector(
                onTap: () {
                  for (int i = 0; i < controller.selectedReasonList.length; i++) {
                    controller.selectedDaysPosList.add(0);
                  }
                  Get.dialog(const AuthorityConfirmationDialog());
                },
                child: BorderedButton(
                    width: 2,
                    text: 'NOTIFY',
                    borderRadius: getCustomBorderRadius(15)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
