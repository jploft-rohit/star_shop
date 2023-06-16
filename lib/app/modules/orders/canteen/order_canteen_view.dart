
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/orders/order_canteen_controller.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/base_tab_bar.dart';
import 'package:star_shop/common/color_constants.dart';

import '../../../../common/custom_fab.dart';
import '../../../../common/utils.dart';
import '../../../controller/orders/orders_controller.dart';

class OrderCanteenView extends GetView<OrderCanteenController> {
  const OrderCanteenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: Obx(() => controller.selectedDayPos.value == 0 ? CustomFAB(isIcon: true, buttonText: 'Create Order',icon: Icons.add,onButtonClicked: (){
        Get.toNamed(Routes.createOrderView);
      },) : const SizedBox.shrink()),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 5.h,
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
                          padding: EdgeInsets.symmetric(horizontal: 4),
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
          Center(
            child: Container(
              height: 5.h,
              width: 100.w,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 0),
              decoration: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  boxShadow: [getDeepBoxShadow()],
                  color: ColorConstants.white),
              child: ListView.builder(
                itemCount: controller.dayList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          controller.selectedDayPos.value = index;
                        },
                        child: Container(
                          height: 4.h,
                          width: 45.w+5,
                          margin: const EdgeInsets.only(
                              right: 0, top: 2, bottom: 2),
                          decoration: controller.selectedDayPos.value == index
                              ? getPrimaryDecoration2()
                              : null,
                          child: Center(
                              child: addText(
                                  controller.dayList[index],
                                  getNormalTextFontSIze(),
                                  controller.selectedDayPos.value == index
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
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: BaseTabBar(tabController: controller.durationController,tabList: [
                Tab(
                  text: 'First Break'.tr,
                ),
                Tab(
                  text: 'Second Break'.tr,
                ),
                Tab(
                  text: 'During the Day'.tr,
                ),
              ])),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: TabBarView(
              controller: controller.durationController,
              children: const [
                SubView(),
                SubView(),
                SubView(),
              ],
            ),
          )
        ],
      ),
    );
  }



}

class SubView extends GetView<OrderCanteenController> {
  const SubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 5.h,
              child: ListView.builder(
                itemCount: controller.classList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector(
                        onTap: () {
                          controller.selectedClassPos.value = index;
                        },
                        child: Container(
                          height: 4.h,
                          width: 21.w,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: controller.selectedClassPos.value == index
                              ? getPrimaryDecoration2()
                              : getEditTextDecoration(),
                          child: Center(
                              child: addText(
                                  controller.classList[index],
                                  getNormalTextFontSIze(),
                                  controller.selectedClassPos.value == index
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
                    if(Get.find<OrdersController>().tabController?.index == 0 && controller.selectedTypePos.value == 3){
                      Get.toNamed(Routes.canteenOrderReturnView);
                    } else {
                      Get.toNamed(Routes.canteenOrderDetailView);
                    }

                    // Get.log(Get.find<OrdersController>().tabController!.index.toString());
                    // Get.log(controller.selectedTypePos.value.toString());

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
                                buildInfoItems('Quantity', '4'),
                                buildInfoItems('Order Date', '01/08/2022'),
                                buildInfoItems('Serving Day', 'Today'),
                                buildInfoItems('Serving Place', 'Canteen'),
                              ],
                            )),




                            if (controller.selectedTypePos.value == 0)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorConstants.primaryColor),
                                    color: ColorConstants.primaryColorLight,
                                    borderRadius: getCurvedBorderRadius()
                                ), child: addText('IN PROCESS', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                              ),


                            if (controller.selectedTypePos.value == 1)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorConstants.primaryColor),
                                    color: ColorConstants.primaryColorLight,
                                    borderRadius: getCurvedBorderRadius()
                                ), child: addText('PACKED', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                              ),

                            if (controller.selectedTypePos.value == 2)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorConstants.primaryColor),
                                    color: ColorConstants.primaryColorLight,
                                    borderRadius: getCurvedBorderRadius()
                                ), child: addText('SERVED', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
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
