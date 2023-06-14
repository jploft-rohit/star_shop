import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/circular_bordered_button.dart';

import '../../../../common/bordered_button.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';
import '../../../controller/create_order/uniform_menu_controller.dart';
import '../../../routes/app_routes.dart';

class UniformSizeDialog extends GetView<MenuUniformController> {
  const UniformSizeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.transparent,
                    ),
                  ),
                  addText('For Coat', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: ColorConstants.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                color: Colors.white,
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(
                      color: ColorConstants.borderColor2.withOpacity(0.5)),
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: addAlignedText('Size', getSmallTextFontSIze(),
                            ColorConstants.black, FontWeight.bold),
                      ),
                      addAlignedText('Age', getSmallTextFontSIze(),
                          ColorConstants.black, FontWeight.bold),
                      addAlignedText('Chest', getSmallTextFontSIze(),
                          ColorConstants.black, FontWeight.bold),
                      addAlignedText('Across Shoulder', getSmallTextFontSIze(),
                          ColorConstants.black, FontWeight.bold),
                      addAlignedText('Shirt Length', getSmallTextFontSIze(),
                          ColorConstants.black, FontWeight.bold),
                    ]),
                    buildTableRow('28', '7-8 Y', ' 28 in', '13 in', '22.5 in'),
                    buildTableRow('30', '9-10 Y', ' 30 in', '14 in', '24 in'),
                    buildTableRow(
                        '32', '11-12 Y', ' 32 in', '14.5 in', '25 in'),
                    buildTableRow('34', '13-14 Y', ' 34 in', '16 in', '26 in'),
                    buildTableRow('36', '14-15 Y', ' 36 in', '17 in', '27 in'),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              addAlignedText('Select Size', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
              SizedBox(height: 1.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 5.h,
                    child: ListView.builder(
                      itemCount: controller.sizeList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Obx(() => GestureDetector (
                          onTap: (){
                            controller.sizeSelectedPos.value = index;
                          },
                          child: Container(
                            height: 5.h,
                            width: 5.h,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: controller.sizeSelectedPos.value == index ? getPrimaryDecoration2() : getEditTextDecoration(),
                            child: Center(child: addText(controller.sizeList[index], getNormalTextFontSIze(), controller.sizeSelectedPos.value == index ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.normal)),
                          ),
                        ));
                      },
                    ),
                  ),


                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.primaryColor),
                      shape: BoxShape.circle,
                      color: ColorConstants.primaryColorLight
                    ), child: const Icon(Icons.add,color: ColorConstants.primaryColor,),
                  )



                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: (){
                  Get.back();
                  controller.initializeManualSizeEditTexts();
                  Get.toNamed(Routes.setManualSizeView);
                },
                child: BorderedButton(width: 50.w, text: 'SET A SIZE'),
              )



            ],
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: ColorConstants.borderColor2.withOpacity(0.5),
      thickness: 1,
      height: 2.h,
    );
  }

  TableRow buildTableRow(String size, String age, String chest,
      String acrossShoulder, String shirtLength) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: addAlignedText(size, getSmallTextFontSIze(),
            ColorConstants.black, FontWeight.normal),
      ),
      addAlignedText(
          age, getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal),
      addAlignedText(chest, getSmallTextFontSIze(), ColorConstants.black,
          FontWeight.normal),
      addAlignedText(acrossShoulder, getSmallTextFontSIze(),
          ColorConstants.black, FontWeight.normal),
      addAlignedText(shirtLength, getSmallTextFontSIze(), ColorConstants.black,
          FontWeight.normal),
    ]);
  }
}
