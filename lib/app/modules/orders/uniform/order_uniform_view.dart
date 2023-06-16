
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/orders/order_uniform_controller.dart';
import 'package:star_shop/common/color_constants.dart';

import '../../../../common/utils.dart';
import '../../../controller/orders/orders_controller.dart';
import '../../../routes/app_routes.dart';

class OrderUniformView extends GetView<OrderUniformController> {
  const OrderUniformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 4.h,
              child: ListView.builder(
                itemCount: controller.typeList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector(
                        onTap: () {
                          controller.selectedTypePos.value = index;
                        },
                        child: Container(
                          height: 4.h,
                          width: 21.w,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: controller.selectedTypePos.value == index
                              ? getPrimaryDecoration2()
                              : getEditTextDecoration(),
                          child: Center(
                              child: addText(
                                  controller.typeList[index],
                                  getNormalTextFontSIze(),
                                  controller.selectedTypePos.value == index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.borderColor,
                                  FontWeight.normal)),
                        ),
                      ));
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.stationaryOrderDetailView);
                    if(Get.find<OrdersController>().tabController?.index == 2 && controller.selectedTypePos.value == 3){
                      Get.toNamed(Routes.returnOrderView);
                    } else {
                      Get.toNamed(Routes.stationaryOrderDetailView);
                    }
                  },
                  child: Container(
                    width: 100.w,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 8),
                    padding: const EdgeInsets.only(
                        left: 20, top: 20, bottom: 10, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        boxShadow: [getDeepBoxShadow()],
                        color: ColorConstants.white),
                    child: Obx(() => Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                buildInfoItems('Order ID', '#456732'),
                                buildInfoItems('Order Total', '42 AED'),
                                buildInfoItems('Order Date', '01/08/2022'),
                              ],
                            )),
                            if (controller.selectedTypePos.value == 0)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstants.primaryColor),
                                    color: ColorConstants.primaryColorLight,
                                    borderRadius: getCurvedBorderRadius()),
                                child: addText(
                                    'IN PROCESS',
                                    getSmallestTextFontSIze(),
                                    ColorConstants.primaryColor,
                                    FontWeight.bold),
                              ),
                            if (controller.selectedTypePos.value == 1)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstants.primaryColor),
                                    color: ColorConstants.primaryColorLight,
                                    borderRadius: getCurvedBorderRadius()),
                                child: addText(
                                    'COMPLETED',
                                    getSmallestTextFontSIze(),
                                    ColorConstants.primaryColor,
                                    FontWeight.bold),
                              ),
                            if (controller.selectedTypePos.value == 2)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstants.primaryColor),
                                    color: ColorConstants.primaryColorLight,
                                    borderRadius: getCurvedBorderRadius()),
                                child: addText(
                                    'CANCELLED',
                                    getSmallestTextFontSIze(),
                                    ColorConstants.primaryColor,
                                    FontWeight.bold),
                              ),
                            if (controller.selectedTypePos.value == 3)
                              GestureDetector(
                                onTap: (){
                                  Get.toNamed(Routes.messageView);
                                },
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/ic_chat.svg'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    addText('Chat', getSmallTextFontSIze(),
                                        ColorConstants.black, FontWeight.normal)
                                  ],
                                ),
                              )
                          ],
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
