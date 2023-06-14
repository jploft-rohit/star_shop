import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/create_order/canteen_menu_controller.dart';

import '../../../../common/app_header.dart';
import '../../../../common/bordered_button.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';
import 'order_reciept_dialog.dart';

class CanteenCart extends GetView<CanteenMenuController> {
  const CanteenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Tray',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: addText('Order for', getNormalTextFontSIze(),
                      ColorConstants.black, FontWeight.bold)),
              SizedBox(
                height: 1.h,
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
                              border: Border.all(
                                  color: ColorConstants.primaryColor),
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
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText('Added Items', getNormalTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorConstants.primaryColorLight,
                          boxShadow: [getDeepBoxShadow()],
                          border: Border.all(
                              color: ColorConstants.primaryColor, width: 1.5),
                          borderRadius: getBorderRadiusCircular()),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Center(
                          child: addText('Add Item', getNormalTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.w900),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ColorConstants.white,
                        borderRadius: getCurvedBorderRadius(),
                        boxShadow: [getDeepBoxShadow()]),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: getCurvedBorderRadius(),
                        //   child: Image.network(
                        //     'https://picsum.photos/id/${(index * 8)}/200/300',
                        //     width: 20.w,
                        //     height: 20.w,
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                            child: Image.asset('assets/images/im_canteen_0${index+1}.png',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText('NFC Tags', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.normal),
                            const SizedBox(
                              height: 2,
                            ),
                            addText('15 AED', getNormalTextFontSIze(),
                                ColorConstants.primaryColor, FontWeight.bold),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_delete.svg',
                                  color: Colors.red,
                                ),
                                addText('Remove', getNormalTextFontSIze(),
                                    Colors.red, FontWeight.normal)
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),

              buildBill('Sub Total', '130 AED'),
              SizedBox(
                height: 1.h,
              ),
              buildBill('Taxes (5%)', '6.5 AED'),
              SizedBox(
                height: 1.h,
              ),
              buildBill('Grand Total', '136.5 AED'),
              SizedBox(
                height: 1.h,
              ),
              const Divider(),
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: addText(
                    'Select Payment Method',
                    getHeadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.bold),
              ),
              SizedBox(height: 2.h,),
              Center(
                child: SizedBox(
                  height: 12 .h,
                  child: ListView.builder(
                    itemCount: controller.paymentImageList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          controller.selectedPaymentPos.value = index;
                        },
                        child: Obx(
                              () => Container(
                            width: 27.w,
                            margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2),
                            decoration: BoxDecoration(
                                color: controller.selectedPaymentPos.value == index
                                    ? ColorConstants.primaryColorLight
                                    : ColorConstants.white,
                                boxShadow: [getBoxShadow()],
                                borderRadius: getBorderRadius()),
                            child: Stack(

                              children: [
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [getDeepBoxShadow()],
                                        color: controller.selectedPaymentPos.value == index
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.borderColor2),
                                    child: Icon(
                                      Icons.check,
                                      color: ColorConstants.white,
                                      size: getNormalTextFontSIze(),
                                    ),
                                  ),
                                ),

                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: SvgPicture.asset(
                                          controller.paymentImageList[index],
                                          // color: controller.selectedPaymentPos.value == index ? ColorConstants.primaryColor : ColorConstants.black,
                                          color: ColorConstants.primaryColor,
                                          height: getLargeTextFontSIze(),
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      addText(controller.paymentTitleList[index], getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.dialog(const CanteenOrderSummaryReceiptDialog());
                  },
                  child: BorderedButton(width: 70.w, text: 'CHECKOUT'),
                ),
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

  Widget buildBill(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addText(title, getNormalTextFontSIze(), ColorConstants.black,
            FontWeight.normal),
        addText(amount, getNormalTextFontSIze(), ColorConstants.primaryColor,
            FontWeight.bold),
      ],
    );
  }
}
