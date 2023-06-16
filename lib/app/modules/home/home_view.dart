import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/orders/order_canteen_controller.dart';
import '../../../common/color_constants.dart';
import '../../../common/drawer.dart';
import '../../../common/utils.dart';
import '../../controller/home_controller.dart';
import '../../routes/app_routes.dart';
import '../news/news_details_screen.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        backgroundColor: ColorConstants.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.only(right: 5),
          child: GestureDetector(
            onTap: () {
              controller.key.currentState!.openDrawer();
            },
            child: SvgPicture.asset(
              'assets/images/ic_menu.svg',
              height: getSmallestTextFontSIze(),
              width: getSmallestTextFontSIze(),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Get.toNamed(Routes.sos);
            },
            child: SvgPicture.asset(
              'assets/images/ic_sos.svg',
              height: getLargeTextFontSIze() * 1.3,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.notificationView);
            },
            child: SvgPicture.asset(
                'assets/images/notification.svg',
                height: getLargeTextFontSIze() * 1.2),
          ),
          const SizedBox(width: 20,)
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: addText('Dashboard', getHeadingTextFontSIze(),
                          ColorConstants.black, FontWeight.bold),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: getBorderRadius(),
                            border:
                                Border.all(color: ColorConstants.borderColor),
                            color: ColorConstants.primaryColorLight),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 4),
                        child: buildSchoolDropDown(controller.schoolItems, controller.selectedSchool, 'Hint', 50.w),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                GridView.builder(
                  itemCount: controller.gridList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.6,
                      mainAxisSpacing: 1.h
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if(index == 0){
                        Get.toNamed(Routes.currentOrderView);
                      } else if(index == 1){
                        Get.toNamed(Routes.orderView);
                      } else if(index == 2){
                        Get.toNamed(Routes.orderView);
                      } else if(index == 3){
                        Get.toNamed(Routes.orderView);
                      } else if(index == 4){
                        Get.toNamed(Routes.orderView);
                        Get.put(OrderCanteenController());
                        Get.find<OrderCanteenController>().selectedTypePos.value = 0;
                      } else if(index == 5){
                        Get.toNamed(Routes.orderView);
                        Get.put(OrderCanteenController());
                        Get.find<OrderCanteenController>().selectedTypePos.value = 2;
                      } else if(index == 6){
                        // Get.toNamed(Routes.walletView,arguments: {
                        //   'heading' : 'Today Transaction'
                        // });
                        Get.toNamed(Routes.transactionRecordView,arguments: {
                          'type' : 'today'
                        });
                      } else if(index == 7){
                        // Get.toNamed(Routes.walletView,arguments: {
                        //   'heading' : 'Transactions Record'
                        // });
                        Get.toNamed(Routes.transactionRecordView,arguments: {
                          'type' : 'record'
                        });
                      }
                    },
                    child: Container(
                      margin: index.isEven
                          ? const EdgeInsets.only(left: 0, bottom: 10)
                          : const EdgeInsets.only(right: 0, bottom: 10),
                      decoration: BoxDecoration(
                          boxShadow: [getDeepBoxShadow()],
                          color: ColorConstants.white,
                          borderRadius: getCurvedBorderRadius()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addAlignedText(
                              controller.gridList[index].title,
                              getNormalTextFontSIze(),
                              ColorConstants.black,
                              FontWeight.bold),
                          SizedBox(height: 0.5.h,),
                          addAlignedText(
                              controller.gridList[index].count,
                              getLargeTextFontSIze(),
                              ColorConstants.primaryColor,
                              FontWeight.bold),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 2.h,),
                buildOrdersAndStocks(),
                SizedBox(height: 2.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        addText('News / Broadcast', getHeadingTextFontSIze(),
                            ColorConstants.black, FontWeight.w700),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              color: ColorConstants.primaryColor,
                              shape: BoxShape.circle),
                          child: addText('10', getSmallestTextFontSIze(),
                              ColorConstants.white, FontWeight.normal),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.newsView);
                      },
                      child: addUnderlineLineText(
                          'View All',
                          getNormalTextFontSIze(),
                          ColorConstants.primaryColor,
                          FontWeight.w400),
                    )
                  ],
                ),
                ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildNewsItem(index);
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildScheduleItem(int index) {
    return GestureDetector(
      onTap: () async {
        controller.scheduleSelectedPos.value = index;
      },
      child: Obx(
        () => Container(
          width: 100.w,
          margin: EdgeInsets.symmetric(vertical: 1.5.h),
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
          decoration: BoxDecoration(
              color: controller.scheduleSelectedPos.value == index
                  ? ColorConstants.primaryColorLight
                  : ColorConstants.white,
              boxShadow: [getDeepBoxShadow()],
              border: controller.scheduleSelectedPos.value == index
                  ? Border.all(color: ColorConstants.primaryColor, width: 1.5)
                  : null,
              borderRadius: getCurvedBorderRadius()),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addText(
                              '1st Pickup Trip',
                              getSubheadingTextFontSIze(),
                              controller.scheduleSelectedPos.value == index
                                  ? ColorConstants.primaryColor
                                  : ColorConstants.gretTextColor,
                              FontWeight.w700),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/route.svg',
                                  color: controller.scheduleSelectedPos.value ==
                                          index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor),
                              const SizedBox(
                                width: 5,
                              ),
                              addText(
                                  'Route 1',
                                  getNormalTextFontSIze(),
                                  controller.scheduleSelectedPos.value == index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor,
                                  FontWeight.w700),
                            ],
                          ),
                          buildDivider(),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/passengers.svg',
                                color: controller.scheduleSelectedPos.value ==
                                        index
                                    ? ColorConstants.primaryColor
                                    : ColorConstants.gretTextColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              addText(
                                  'Passenger - 30',
                                  getNormalTextFontSIze(),
                                  controller.scheduleSelectedPos.value == index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor,
                                  FontWeight.w700),
                            ],
                          ),
                          buildDivider(),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/stop.svg',
                                color: controller.scheduleSelectedPos.value ==
                                        index
                                    ? ColorConstants.primaryColor
                                    : ColorConstants.gretTextColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              addText(
                                  'Stops - 12',
                                  getNormalTextFontSIze(),
                                  controller.scheduleSelectedPos.value == index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor,
                                  FontWeight.w700),
                            ],
                          ),
                          buildDivider(),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/passengers.svg',
                                color: controller.scheduleSelectedPos.value ==
                                        index
                                    ? ColorConstants.primaryColor
                                    : ColorConstants.gretTextColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              addText(
                                  'Emergency Pickup - 3',
                                  getNormalTextFontSIze(),
                                  controller.scheduleSelectedPos.value == index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor,
                                  FontWeight.w700),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, innerIndex) {
                          return Container(
                            margin: const EdgeInsets.only(left: 10, bottom: 10),
                            child: Row(
                              children: [
                                addText(
                                    'Start in',
                                    getNormalTextFontSIze(),
                                    controller.scheduleSelectedPos.value ==
                                            index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.gretTextColor,
                                    FontWeight.w700),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: controller
                                              .scheduleSelectedPos.value ==
                                          index
                                      ? getPrimaryDecoration()
                                      : BoxDecoration(
                                          borderRadius: getEdgyBorderRadius(),
                                          border: Border.all(
                                              color:
                                                  ColorConstants.borderColor),
                                          color: ColorConstants.etBgColor),
                                  padding: const EdgeInsets.all(5),
                                  child: addText(
                                      '05',
                                      getNormalTextFontSIze(),
                                      controller.scheduleSelectedPos.value ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.gretTextColor,
                                      FontWeight.w700),
                                ),
                                addText(
                                    ' : ',
                                    getNormalTextFontSIze(),
                                    controller.scheduleSelectedPos.value ==
                                            index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.gretTextColor,
                                    FontWeight.w700),
                                Container(
                                  decoration: controller
                                              .scheduleSelectedPos.value ==
                                          index
                                      ? getPrimaryDecoration()
                                      : BoxDecoration(
                                          borderRadius: getEdgyBorderRadius(),
                                          border: Border.all(
                                              color:
                                                  ColorConstants.borderColor),
                                          color: ColorConstants.etBgColor),
                                  padding: const EdgeInsets.all(5),
                                  child: addText(
                                      '05',
                                      getNormalTextFontSIze(),
                                      controller.scheduleSelectedPos.value ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.gretTextColor,
                                      FontWeight.w700),
                                ),
                              ],
                            ),
                          );
                        },
                      ))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget buildNewsItem(int index) {
    return GestureDetector(
      onTap: (){
        Get.to(const NewsDetailScreen());
      },
      child: Container(
        width: 100.w,
        margin: EdgeInsets.symmetric(vertical: 1.5.h),
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        decoration: BoxDecoration(
            color: index.isEven ? const Color(0xffF5F5F5) : ColorConstants.primaryColorLight,
            boxShadow: [getBoxShadow()],
            borderRadius: getCurvedBorderRadius()),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText(
                        'Principal’s Honouring Ceremony',
                        getSubheadingTextFontSIze(),
                        ColorConstants.black,
                        FontWeight.w700),
                    SizedBox(
                      height: 2.h,
                    ),
                    addText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam...',
                        getSmallTextFontSIze(),
                        ColorConstants.amberBlack.withOpacity(0.6),
                        FontWeight.normal),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        addText(
                            'School Admin',
                            getSmallTextFontSIze(),
                            ColorConstants.amberBlack.withOpacity(0.4),
                            FontWeight.normal),
                        const SizedBox(
                          width: 25,
                        ),
                        addText(
                            '15 mins ago',
                            getSmallTextFontSIze(),
                            ColorConstants.amberBlack.withOpacity(0.4),
                            FontWeight.normal),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Widget buildDivider() {
    return SizedBox(
        width: 40.w,
        child: Divider(
          color: ColorConstants.primaryColor.withOpacity(0.1),
          thickness: 2,
        ));
  }

  Widget buildOrdersAndStocks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          // onTap: () => Get.toNamed(Routes.menuItemList),
          onTap: () => Get.toNamed(Routes.productBaseView,arguments: {'initialIndex' : 2}),
          child: Container(
            width: 29.w,
            height: 30.w,
            decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.primaryColor),
                borderRadius: getCurvedBorderRadius()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addAlignedText('Menu Items', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.bold),
                SizedBox(
                  height: 2.h,
                ),
                SvgPicture.asset(
                  'assets/images/ic_menu_home.svg',
                  height: 6.h,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: ()=>Get.toNamed(Routes.createOrderView),
          child: Container(
            width: 29.w,
            height: 30.w,
            decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.primaryColor),
                borderRadius: getCurvedBorderRadius()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addText('Create Order', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.bold),
                SizedBox(
                  height: 2.h,
                ),
                SvgPicture.asset(
                  'assets/images/ic_create_order_home.svg',
                  height: 6.h,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Get.toNamed(Routes.outOfStockItems);
          },
          child: Container(
            width: 29.w,
            height: 30.w,
            decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.primaryColor),
                borderRadius: getCurvedBorderRadius()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addAlignedText('Out of Stock Items', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.bold),
                SizedBox(
                  height: 1.h,
                ),
                addAlignedText('15', getLargeTextFontSIze() * 1.5,
                    ColorConstants.primaryColor, FontWeight.bold)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
