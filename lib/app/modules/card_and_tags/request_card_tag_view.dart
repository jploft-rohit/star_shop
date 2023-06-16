import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/bordered_button.dart';
import 'package:star_shop/common/utils.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../controller/card_and_tag_controller.dart';
import '../../routes/app_routes.dart';

class RequestCardAndTagsView extends GetView<CardAndTagsController> {
  const RequestCardAndTagsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Request Cards & Tags',
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.h),
                  shrinkWrap: true,
                  itemCount: controller.quantityList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 25.h,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: getCurvedBorderRadius(),
                          boxShadow: kElevationToShadow[2],
                          color: ColorConstants.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: getCurvedBorderRadius(),
                              ),
                              width: double.infinity,
                              height: 15.h,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                child: Image.asset(
                                  controller.imageList[index],
                                  height: 15.h,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                addText(
                                    'NFC Tags',
                                    getNormalTextFontSIze() + 2,
                                    ColorConstants.black,
                                    FontWeight.w400),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    addText(
                                        '10 AED',
                                        getNormalTextFontSIze(),
                                        ColorConstants.primaryColor,
                                        FontWeight.bold),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              getCurvedBorderRadius(),
                                          border: Border.all(
                                              color: ColorConstants
                                                  .primaryColor),
                                          boxShadow: [getDeepBoxShadow()],
                                          color: ColorConstants
                                              .primaryColorLight),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // if(controller.quantityList[index] > 1){
                                              //   controller.quantityList[index] = controller.quantityList[index] - 1;
                                              //   controller.quantityList.assignAll(controller.quantityList);
                                              // }
                                            },
                                            child: addText(
                                                '-',
                                                getNormalTextFontSIze(),
                                                ColorConstants
                                                    .primaryColor,
                                                FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          addText(
                                              controller
                                                  .quantityList[index]
                                                  .toString(),
                                              getNormalTextFontSIze(),
                                              ColorConstants.primaryColor,
                                              FontWeight.bold),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // controller.quantityList[index] = controller.quantityList[index] + 1;
                                              // controller.quantityList.assignAll(controller.quantityList);
                                            },
                                            child: addText(
                                                '+',
                                                getNormalTextFontSIze(),
                                                ColorConstants
                                                    .primaryColor,
                                                FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ))),
            ),
            SizedBox(height: 2.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.cardAndTagCartView);
                },
                child: BorderedButton(width: 50.w, text: 'ADD TO CART',borderRadius: getCustomBorderRadius(15)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: ColorConstants.borderColor2.withOpacity(0.5),
      thickness: 2,
      height: 3.h,
    );
  }
}
