import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/refund_request_controller.dart';
import 'package:star_shop/app/modules/transaction_record/transaction_detail_dialog.dart';

import '../../../common/app_header.dart';
import '../../../common/bordered_button.dart';
import '../../../common/circular_bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/home_controller.dart';
import '../../controller/transaction_record_controller.dart';

class RefundRequestView extends GetView<RefundRequestController>{
  const RefundRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Refund Request',
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor2)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/images/trips_completed.svg',
                            height: getHeadingTextFontSIze(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          buildBoldSchoolDropDown(
                              Get.find<HomeController>().schoolItems,
                              Get.find<HomeController>().selectedSchool,
                              'Hint',
                              30.w),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                        child: VerticalDivider(
                          thickness: 1,
                          color: ColorConstants.borderColor2,
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/images/ic_order_type.svg',
                            height: getHeadingTextFontSIze(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          buildBoldSchoolDropDown(controller.orderTypeList,
                              controller.selectedOrderType, 'Order Type', 30.w)
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    height: 0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.search,
                        size: getHeadingTextFontSIze(),
                        color: ColorConstants.borderColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: addText(
                            'Search Star,ID',
                            getNormalTextFontSIze(),
                            ColorConstants.lightTextColor,
                            FontWeight.normal),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap:(){
                      showPicker(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: ColorConstants.borderColor2),
                          borderRadius: getBorderRadius()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_calendar.svg',
                            height: getHeadingTextFontSIze(),
                          ),
                          addText('From : 10/10/2022', getSmallTextFontSIze(),
                              ColorConstants.gretTextColor, FontWeight.normal),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap:(){
                      showPicker(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: ColorConstants.borderColor2),
                          borderRadius: getBorderRadius()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_calendar.svg',
                            height: getHeadingTextFontSIze(),
                          ),
                          addText('To : 10/10/2022', getSmallTextFontSIze(),
                              ColorConstants.gretTextColor, FontWeight.normal),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),

            SizedBox(
              height: 5.h,
              child: ListView.builder(
                itemCount: controller.categoryList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector(
                    onTap: () {
                      controller.selectedCategoryPos.value = index;
                    },
                    child: Container(
                      width: 27.w,
                      margin: const EdgeInsets.only(right: 10,top: 2,bottom: 2),
                      decoration: controller.selectedCategoryPos.value == index
                          ? getPrimaryDecoration2()
                          : getEditTextDecoration(),
                      child: Center(
                          child: addText(
                              controller.categoryList[index],
                              getNormalTextFontSIze(),
                              controller.selectedCategoryPos.value == index
                                  ? ColorConstants.primaryColor
                                  : ColorConstants.borderColor,
                              FontWeight.normal)),
                    ),
                  ));
                },
              ),
            ),

            SizedBox(height: 2.h,),

            Expanded(
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FadeInUp(
                    duration: Duration(milliseconds: 200*(index+1)),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        boxShadow: [getBoxShadow()],
                        borderRadius: getBorderRadius(),
                        color: ColorConstants.white,
                      ),
                      child: Column(
                        children: [

                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 0),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.borderColor2),
                              borderRadius: getCustomBorderRadius(15),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration:  BoxDecoration(
                                    borderRadius: getCustomBorderRadius(15),
                                    border: Border.all(color: ColorConstants.primaryColor),
                                  ),
                                  child: SvgPicture.asset('assets/images/ic_driver.svg',height: getLargeTextFontSIze()*1.5,),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      buildInfoItems('Name', 'Rahish'),
                                      buildInfoItems('Designation', 'Bus Driver'),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height: 2.h,),
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/images/fab_calendar.svg',
                                      height: getHeadingTextFontSIze()),
                                  const SizedBox(width: 10,),
                                  addText('01/03/2022', getNormalTextFontSIze(),
                                      ColorConstants.primaryColor, FontWeight.bold)
                                ],
                              ),
                              const Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.access_time,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),
                                  const SizedBox(width: 10,),
                                  addText('9:30 pm', getNormalTextFontSIze(),
                                      ColorConstants.primaryColor, FontWeight.bold)
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                          buildDivider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/images/ic_reason.svg',
                                height: getHeadingTextFontSIze(),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              addText('Reason :', getSmallTextFontSIze() + 1,
                                  ColorConstants.black, FontWeight.normal),
                              Expanded(
                                child: addText(
                                    ' Lorem Ipsum is simply dummy text...',
                                    getSmallTextFontSIze() + 1,
                                    ColorConstants.primaryColor,
                                    FontWeight.bold),
                              ),
                            ],
                          ),
                          buildDivider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/images/ic_coins.svg',
                                height: getHeadingTextFontSIze(),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              addText('Amount :', getSmallTextFontSIze() + 1,
                                  ColorConstants.black, FontWeight.normal),
                              Expanded(
                                child: addText(
                                    ' 15 AED',
                                    getSmallTextFontSIze() + 1,
                                    ColorConstants.primaryColor,
                                    FontWeight.bold),
                              ),
                            ],
                          ),
                          buildDivider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/images/ic_reason.svg',
                                height: getHeadingTextFontSIze(),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              addText('Order Id :', getSmallTextFontSIze() + 1,
                                  ColorConstants.black, FontWeight.normal),
                              Expanded(
                                child: addText(
                                    ' #546374',
                                    getSmallTextFontSIze() + 1,
                                    ColorConstants.primaryColor,
                                    FontWeight.bold),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Get.lazyPut(() => TransactionRecordController());
                                  Get.dialog(const TransactionDetailDialog());
                                },
                                child: const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,),
                              ),

                            ],
                          ),
                          SizedBox(height: 2.h,),
                          Row(
                            children: [


                              Expanded(

                                child: GestureDetector(
                                  onTap: (){
                                    showCommentDialog();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: getSmallestTextFontSIze()),
                                    decoration: getEditTextDecoration(),
                                    child: addAlignedText('COMMENTS', getNormalTextFontSIze(), ColorConstants.lightTextColor, FontWeight.bold),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10,),

                              Expanded(

                                child: GestureDetector(
                                  onTap: (){
                                    Get.dialog(buildConfirmationDialog());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: getSmallestTextFontSIze()),
                                    decoration: BoxDecoration(
                                        borderRadius: getBorderRadius(),
                                        boxShadow: [getBoxShadow()],
                                        border: Border.all(color: ColorConstants.primaryColor),
                                        color: ColorConstants.primaryColorLight),
                                    child: addAlignedText('APPROVE', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10,),

                              Expanded(

                                child: GestureDetector(
                                  onTap: (){
                                    showCommentDialog();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: getSmallestTextFontSIze()),
                                    decoration: getEditTextDecoration(),
                                    child: addAlignedText('REJECT', getNormalTextFontSIze(), ColorConstants.lightTextColor, FontWeight.bold),
                                  ),
                                ),
                              ),


                            ],
                          )




                        ],
                      ),
                    ),
                  );
                },
              ),
            )



          ],
        ),
      ),
    );
  }


  buildConfirmationDialog(){
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

              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.close,color: ColorConstants.borderColor,size: getLargeTextFontSIze(),)),
              ),
              SizedBox(
                height: 2.h,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Are you sure to Refund the amount of".tr,
                        style: TextStyle(
                          fontFamily: 'Ariel',
                          fontSize: getSubheadingTextFontSIze(),
                          color: ColorConstants.black,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                      text: " 12 AED ".tr,
                      style: TextStyle(
                        fontFamily: 'Ariel',
                        fontSize: getSubheadingTextFontSIze(),
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    TextSpan(
                        text: "to the requested users wallet?".tr,
                        style: TextStyle(
                          fontFamily: 'Ariel',
                          fontSize: getSubheadingTextFontSIze(),
                          color: ColorConstants.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),



              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CircularBorderedButton(width: 30.w, text: 'CONFIRM'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showCommentDialog(){
    Get.dialog(Scaffold(
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
                  addText('Add Comment', getSubheadingTextFontSIze(),
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: getEditTextDecoration(),
                child: buildLineEditText(controller.commentController!, 'Comment'),
              ),

              SizedBox(
                height: 2.h,
              ),

              GestureDetector(
                onTap: (){},
                child: BorderedButton(width: 40.w, text: 'SUBMIT'),
              )



            ],
          ),
        ),
      ),
    ));
  }

}