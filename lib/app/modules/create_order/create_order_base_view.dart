import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/create_order/create_order_controller.dart';
import 'package:star_shop/app/modules/create_order/dialog/create_order_search_dialog.dart';
import 'package:star_shop/app/modules/sos/qr_scanner_view.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/bordered_button.dart';
import 'package:star_shop/common/color_constants.dart';

import '../../../common/app_header.dart';
import '../../../common/bordered_button2.dart';
import '../../../common/utils.dart';
import '../qr_scanner/sos_scanQR.dart';

class CreateOrderBaseView extends GetView<CreateOrderController> {
  const CreateOrderBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Create Order',
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                childAspectRatio: 2.8,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  controller.selectedPos.value = index;
                  if(index == 1){
                    Get.to(const ScanQrCodeScreen());
                  }
                },
                child: Obx(
                  () => Container(
                    width: 27.w,
                    // margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 2),
                    margin: const EdgeInsets.only(top: 2, bottom: 2, right: 0),
                    decoration: BoxDecoration(
                        color: controller.selectedPos.value == index
                            ? ColorConstants.primaryColorLight
                            : ColorConstants.white,
                        boxShadow: [getBoxShadow()],
                        borderRadius: getBorderRadius()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [getDeepBoxShadow()],
                              color: controller.selectedPos.value == index
                                  ? ColorConstants.primaryColor
                                  : ColorConstants.borderColor2),
                          child: Icon(
                            Icons.check,
                            color: ColorConstants.white,
                            size: getNormalTextFontSIze(),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          child: SvgPicture.asset(
                            controller.optionsImageList[index],
                            color: controller.selectedPos.value == index
                                ? ColorConstants.primaryColor
                                : ColorConstants.black,
                            height: getLargeTextFontSIze(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              itemCount: controller.optionsImageList.length,
            ),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: () {
                Get.dialog(const CreateOrderSearchDialog());
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: getEditTextDecoration(),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: ColorConstants.gretTextColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    addText('Search By ID...', getNormalTextFontSIze(),
                        ColorConstants.gretTextColor, FontWeight.normal),
                    const Spacer(),
                    Obx(() => Column(
                          children: [
                            if (controller.selectedPos.value == 0)
                              SvgPicture.asset(
                                'assets/images/nfc.svg',
                                color: ColorConstants.primaryColor,
                                height: getLargeTextFontSIze(),
                              ),
                            if (controller.selectedPos.value == 1)
                              SvgPicture.asset(
                                'assets/images/qrcode.svg',
                                color: ColorConstants.primaryColor,
                                height: getLargeTextFontSIze(),
                              ),
                            if (controller.selectedPos.value == 2)
                             const SizedBox.shrink()
                          ],
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: addText('Order for', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.bold)),
            SizedBox(
              height: 2.h,
            ),
            ListView.builder(
              itemCount: 1,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.borderColor2),
                      borderRadius: getBorderRadius()),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstants.primaryColor),
                            borderRadius: getBorderRadius()),
                        child: SvgPicture.asset(
                          'assets/images/user.svg',
                          height: getHeadingTextFontSIze() * 2,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText(
                                'Raseed Khan (Teacher)',
                                getNormalTextFontSIze(),
                                ColorConstants.black,
                                FontWeight.bold),
                            addText('#4546634', getSmallTextFontSIze(),
                                ColorConstants.primaryColor, FontWeight.bold),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/images/ic_delete.svg',
                          height: getHeadingTextFontSIze(),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.menuBaseView);
                    },
                    child: BorderedButton2(
                      width: 50.w,
                      text: 'VISITOR',
                      horizontalPadding: 5.w,
                      borderRadius: getCustomBorderRadius(15),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.menuBaseView);
                    },
                    child: BorderedButton2(
                        width: 50.w, text: 'CONTINUE', horizontalPadding: 5.w,borderRadius: getCustomBorderRadius(15)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
