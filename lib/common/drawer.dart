import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/my_profile_controller.dart';
import 'package:star_shop/app/modules/assignments/awareness.dart';
import 'package:star_shop/app/modules/assignments/worksheet_view.dart';
import 'package:star_shop/app/modules/pre_orders/pre_order_base_view.dart';
import 'package:star_shop/app/routes/app_routes.dart';

import '../app/controller/base_controller.dart';
import '../app/controller/home_controller.dart';
import 'app_header.dart';
import 'color_constants.dart';
import 'utils.dart';

class AppDrawer extends GetView<HomeController> {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColorLight,
      width: 80.w,
     height: 100.h,
      child: SafeArea(
          child: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SvgPicture.asset(
                    'assets/images/app_logo2.svg',
                    height: 6.h,
                  ),
                ),
              ),
              Divider(
                height: 4.h,
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    initiallyExpanded: true,
                    childrenPadding: EdgeInsets.zero,
                    iconColor: ColorConstants.primaryColor,
                    collapsedIconColor: ColorConstants.primaryColor,
                    title: addText('My Profile', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    backgroundColor: ColorConstants.primaryColorLight,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<BaseController>()
                              .bottomNavigationKey
                              .currentState
                              ?.setPage(2);
                        },
                        child: buildItems('Account'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<BaseController>()
                              .bottomNavigationKey
                              .currentState
                              ?.setPage(2);
                          Get.find<MyProfileController>().controller.index = 1;
                        },
                        child: buildItems('Details'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<BaseController>()
                              .bottomNavigationKey
                              .currentState
                              ?.setPage(2);
                          Get.find<MyProfileController>().controller.index = 3;
                        },
                        child: buildItems('Schools'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<BaseController>()
                              .bottomNavigationKey
                              .currentState
                              ?.setPage(2);
                          Get.find<MyProfileController>().controller.index = 2;
                        },
                        child: buildItems('Staff'),
                      ),
                    ]),
              ),
              getSpace(),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.to(const PreOrdersBaseView());
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Pre Orders', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              getSpace(),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.createOrderView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Create Order', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              getSpace(),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.orderView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Orders', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              getSpace(),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.productBaseView,
                      arguments: {'initialIndex': 0});
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Products', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    initiallyExpanded: true,
                    childrenPadding: EdgeInsets.zero,
                    iconColor: ColorConstants.primaryColor,
                    collapsedIconColor: ColorConstants.primaryColor,
                    title: addText('Assignment', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    backgroundColor: ColorConstants.primaryColorLight,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const Awareness());
                        },
                        child: buildItems('Awareness & Courses'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const MyWorkSheetView());
                        },
                        child: buildItems('Worksheet'),
                      ),
                    ]),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.transactionRecordView,
                      arguments: {'type': 'record'});
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Transactions Record', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              getSpace(),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.refundRequestView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Refund Request', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              getSpace(),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.taskReminderView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Tasks & Reminders', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              getSpace(),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.complainView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Complaints & Reports', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              getSpace(),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.feedbackView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Feedback & Help', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              getSpace(),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.eventsView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Events', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              getSpace(),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.dialog(Scaffold(
                    backgroundColor: ColorConstants.white,
                    appBar: PreferredSize(
                        preferredSize: Size.fromHeight(7.h),
                        child: const AppHeader(
                          showBackIcon: true,
                          title: 'About App',
                        )),
                    body: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          addText(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              getNormalTextFontSIze(),
                              ColorConstants.black,
                              FontWeight.normal)
                        ],
                      ),
                    ),
                  ),
                  );
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('About App', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
          Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.close,
                  color: ColorConstants.primaryColor,
                  size: getLargeTextFontSIze() * 1.2,
                ),
              ))
        ],
      )),
    );
  }

  Widget buildItems(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              addText(title, getHeadingTextFontSIze(),
                  ColorConstants.primaryColor, FontWeight.normal),
              SvgPicture.asset(
                'assets/images/ic_navigate.svg',
                width: getHeadingTextFontSIze(),
                color: ColorConstants.primaryColor,
              ),
            ],
          ),
          const Divider(
            color: ColorConstants.primaryColor,
          ),
          SizedBox(
            height: 1.h,
          )
        ],
      ),
    );
  }

  Widget getSpace() {
    return SizedBox(
      height: 3.h,
    );
  }
}
