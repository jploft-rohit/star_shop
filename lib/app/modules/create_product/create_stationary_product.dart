import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/create_product_controller.dart';
import 'package:star_shop/common/bordered_button.dart';
import 'package:star_shop/common/utils.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/success_dialog.dart';

class CreateStationaryProduct extends GetView<CreateProductController>{
  const CreateStationaryProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child:  AppHeader(
            showBackIcon: true,
            title: controller.isEdit ? 'Edit Product' : controller.isPreOrder ? 'Create Pre-Order' : 'Create Products',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: const [4, 4],
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(6),
                        color: ColorConstants.lightGreyColor,
                        child: ClipRRect(
                          borderRadius: getCurvedBorderRadius(),
                          child: SizedBox(
                            height: 25.h,
                            width: 40.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_gallery.svg',
                                  height: getLargeTextFontSIze() * 2,
                                ),
                                addText(
                                    'Upload from Albums',
                                    getSmallTextFontSIze(),
                                    ColorConstants.gretTextColor,
                                    FontWeight.normal)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        dashPattern: const [4, 4],
                        padding: const EdgeInsets.all(6),
                        color: ColorConstants.lightGreyColor,
                        child: ClipRRect(
                          borderRadius: getCurvedBorderRadius(),
                          child: SizedBox(
                            height: 25.h,
                            width: 40.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_camera.svg',
                                  height: getLargeTextFontSIze() * 2,
                                ),
                                addText(
                                    'Camera',
                                    getSmallTextFontSIze(),
                                    ColorConstants.gretTextColor,
                                    FontWeight.normal)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding:
                const EdgeInsets.only(top:15,bottom: 15,left: 20,right: 10),
                decoration: getEditTextDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText(controller.type, getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.normal),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 4, bottom: 4, right: 10),
                width: 100.w,
                decoration: getEditTextDecoration(),
                child: buildSchoolDropDown(controller.canteenCategoryList,
                    controller.selectedCategoryType, 'Select Type', 100.w),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 10),
                width: 100.w,
                decoration: getEditTextDecoration(),
                child: addSmallEditText(
                    controller.productNameController!, 'Product Name'),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 10),
                width: 100.w,
                decoration: getEditTextDecoration(),
                child: addSmallEditText(
                    controller.productDescriptionController!, 'Description'),
              ),
              if(!controller.isPreOrder)
              SizedBox(
                height: 2.h,
              ),
              if(!controller.isPreOrder)
              Container(
                padding: const EdgeInsets.only(left: 20, right: 10),
                width: 100.w,
                decoration: getEditTextDecoration(),
                child: addSmallEditText(
                    controller.productPriceController!, 'Price'),
              ),

              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 10),
                width: 100.w,
                decoration: getEditTextDecoration(),
                child: addSmallEditText(
                    controller.productPriceController!, 'Notify out of stock, when left'),
              ),


              if(controller.isPreOrder)
                Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      width: 100.w,
                      decoration: getEditTextDecoration(),
                      child: addSmallEditText(
                          controller.quantityController!, 'Quantity'),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Flexible(child:  Container(
                          padding:
                          const EdgeInsets.only(top:15,bottom: 15,left: 20,right: 10),
                          decoration: getEditTextDecoration(),
                          child: GestureDetector(
                            onTap: ()=> showPicker(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                addText('Request Date', getNormalTextFontSIze(),
                                    ColorConstants.black, FontWeight.normal),
                                SvgPicture.asset('assets/images/fab_calendar.svg',height: getHeadingTextFontSIze(),color: ColorConstants.black,)
                              ],
                            ),
                          ),
                        ),),
                        const SizedBox(width: 10,),
                        Flexible(child:  Container(
                          padding:
                          const EdgeInsets.only(top:15,bottom: 15,left: 20,right: 10),
                          decoration: getEditTextDecoration(),
                          child: GestureDetector(
                            onTap: ()=> showPicker(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                addText('Required Date', getNormalTextFontSIze(),
                                    ColorConstants.black, FontWeight.normal),
                                SvgPicture.asset('assets/images/fab_calendar.svg',height: getHeadingTextFontSIze(),color: ColorConstants.black,)
                              ],
                            ),
                          ),
                        ),),
                      ],
                    )




                  ],
                ),


              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(const SuccessDialog(message: 'Product Created Successfully'));
                },
                child: BorderedButton(width: 50.w, text: controller.isEdit ? 'UPDATE' : 'SUBMIT'),
              )
            ],
          ),
        ),
      ),
    );
  }

}