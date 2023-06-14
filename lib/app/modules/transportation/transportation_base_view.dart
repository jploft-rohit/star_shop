import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/transportation/transportation_controller.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/color_constants.dart';
import '../../../common/app_header.dart';
import '../../../common/utils.dart';

class TransportationBaseView extends GetView<TransportationController> {
  const TransportationBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Transportation',
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
                  border:
                      Border.all(color: ColorConstants.borderColor2, width: 1.5),
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
              FadeInRight(
                duration: const Duration(milliseconds: 100),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.notifyAuthorities);
                  },
                  child: buildItem('Notify Authorities'),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 100),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.busLocationTransportation);
                  },
                  child: buildItem('Locations'),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 100),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.busNotificationView);
                  },
                  child: buildItem('Bus Notifications'),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              buildTabs(),
              SizedBox(
                height: 1.h,
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [getBoxShadow()],
                    borderRadius: getCurvedBorderRadius(),
                    color: ColorConstants.white),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            buildImageInfoItems(
                                'Driver', 'Amir Shaikh', 'transp_bus'),
                            buildImageInfoItems(
                                'Mobile No', '5632478945', 'transp_mobile'),
                            buildImageInfoItems(
                                'Supervisor', 'Ali Khan', 'transp_supervisor'),
                            buildImageInfoItems(
                                'Mobile No', '5632478945', 'transp_mobile'),
                            buildImageInfoItems('Bus School ID', '524632',
                                'transp_bus_school_id'),
                            buildImageInfoItems(
                                'Plate No', '524632', 'transp_plate_no'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.messageView);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFF8F8F8),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          padding: EdgeInsets.symmetric(horizontal: 7.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/ic_chat.svg'),
                              addText('Chat', getSmallestTextFontSIze(),
                                  ColorConstants.black, FontWeight.normal)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: addText('Rate :', getHeadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold)),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.driverRating);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: 28.w,
                      decoration: BoxDecoration(
                          borderRadius: getCustomBorderRadius(12),
                          border: Border.all(color: ColorConstants.primaryColor),
                          boxShadow: [getDeepBoxShadow()],
                          color: ColorConstants.primaryColorLight),
                      child: Center(
                          child: addText('DRIVER', getNormalTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.busRating);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: 28.w,
                      decoration: BoxDecoration(
                          borderRadius: getCustomBorderRadius(12),
                          border: Border.all(color: ColorConstants.primaryColor),
                          boxShadow: [getDeepBoxShadow()],
                          color: ColorConstants.primaryColorLight),
                      child: Center(
                          child: addText('BUS', getNormalTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.supervisorRating);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: 28.w,
                      decoration: BoxDecoration(
                          borderRadius: getCustomBorderRadius(12),
                          border: Border.all(color: ColorConstants.primaryColor),
                          boxShadow: [getDeepBoxShadow()],
                          color: ColorConstants.primaryColorLight),
                      child: Center(
                          child: addText('SUPERVISOR', getNormalTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.bold)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(String title) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.primaryColor),
          borderRadius: getBorderRadius()),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          addText(title, getNormalTextFontSIze(), ColorConstants.primaryColor,
              FontWeight.normal),
          const Icon(
            Icons.arrow_forward,
            color: ColorConstants.primaryColor,
          )
        ],
      ),
    );
  }

  Widget buildTabs() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 5.5.h,
        child: ListView.builder(
          itemCount: controller.tabListItems.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                controller.selectedTabPosition.value = index;
              },
              child: Obx(
                () => Container(
                  margin: const EdgeInsets.all(5),
                  width: 45.w - 10,
                  decoration: controller.selectedTabPosition.value == index
                      ? getPrimaryDecoration2()
                      : getEditTextDecoration(),
                  child: Center(
                      child: addText(
                          controller.tabListItems[index],
                          getNormalTextFontSIze() - 1,
                          controller.selectedTabPosition.value == index
                              ? ColorConstants.primaryColor
                              : ColorConstants.gretTextColor,
                          controller.selectedTabPosition.value == index
                              ? FontWeight.bold
                              : FontWeight.normal)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildImageInfoItems(String title, String description, String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/$image.svg',
              height: getHeadingTextFontSIze(),
            ),
            const SizedBox(
              width: 10,
            ),
            addText('$title :', getNormalTextFontSIze(), ColorConstants.black,
                FontWeight.normal),
            addText(' $description', getNormalTextFontSIze(),
                ColorConstants.primaryColor, FontWeight.bold),
          ],
        ),
        SizedBox(
          height: 0.5.h,
        ),
        const Divider(
          color: ColorConstants.borderColor2,
        ),
        SizedBox(
          height: 0.5.h,
        ),
      ],
    );
  }
}
