import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/transaction_record_controller.dart';
import 'package:star_shop/app/modules/transaction_record/transaction_detail_dialog.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/color_constants.dart';

import '../../../../common/app_header.dart';
import '../../../../common/circular_bordered_button.dart';
import '../../../../common/success_dialog.dart';
import '../../../../common/utils.dart';
import '../../../controller/home_controller.dart';


class TodayTransactionView extends GetView<TransactionRecordController> {
  const TodayTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Today Transactions',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                            'assets/images/ic_staff.svg',
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


            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  boxShadow: [getLightBoxShadow()],
                  border: Border.all(color: ColorConstants.primaryColor),
                  color: ColorConstants.primaryColorLight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  SvgPicture.asset('assets/images/ic_coins.svg',width: 15.w,),
                  Column(
                    children: [
                      // SizedBox(height: 2.h,),
                      addText('Balance', getLargeTextFontSIze(), ColorConstants.primaryColor, FontWeight.w400),
                      SizedBox(height: 2.h,),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "213".tr,
                                style: TextStyle(
                                    fontFamily: 'Ariel',
                                    fontSize: getLargeTextFontSIze()*1.2,
                                    color: ColorConstants.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 3
                                )),
                            TextSpan(
                              text: "AED".tr,
                              style: TextStyle(
                                fontFamily: 'Ariel',
                                fontSize: getLargeTextFontSIze()*1.2,
                                color: ColorConstants.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.h,),
                    ],
                  ),



                  GestureDetector(
                    onTap: (){
                      // Get.dialog(buildCardDetailsDialog());
                      // Get.dialog(const TopUpFamilyDialog());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorConstants.primaryColorLight,
                          shape: BoxShape.circle,
                          boxShadow: [getBoxShadow()],
                          border: Border.all(color: ColorConstants.primaryColor)
                      ),child: const Icon(Icons.add,color: ColorConstants.primaryColor,size: 50,),
                    ),
                  )

                ],
              ),
            ),

            SizedBox(
              height: 2.h,
            ),

            Align(
                alignment: Alignment.topLeft,
                child: addText('Transactions', getHeadingTextFontSIze(), ColorConstants.black, FontWeight.bold)),

            SizedBox(
              height: 2.h,
            ),


            Expanded(
              child: ListView.builder(
                itemCount: 12,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildTransactionItem(index,context);
                },
              ),
            ),




          ],
        ),
      ),
    );
  }


  Widget buildTransactionItem(int index,BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.dialog(const TransactionDetailDialog());
      },
      child: Column(
        children: [

          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ClipRRect(
                //     borderRadius: getCurvedBorderRadius(),
                //     child: Image.network('https://picsum.photos/id/${Random().nextInt(100)}/200/300',width: 15.w,height: 15.w,fit: BoxFit.cover,)),
                ClipRRect(
                    borderRadius: getCurvedBorderRadius(),
                    child: Image.asset('assets/images/im_canteen_0${index+1}.png',width: 15.w,height: 15.w,fit: BoxFit.cover,)),
                const SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Cancelled".tr,
                              style: TextStyle(
                                fontFamily: 'Ariel',
                                fontSize: getNormalTextFontSIze(),
                                color: ColorConstants.black,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                            text: " (Cookies)".tr,
                            style: TextStyle(
                              fontFamily: 'Ariel',
                              fontSize: getSmallestTextFontSIze(),
                              color: ColorConstants.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "2 AED".tr,
                              style: TextStyle(
                                fontFamily: 'Ariel',
                                fontSize: getNormalTextFontSIze(),
                                color: ColorConstants.black,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                            text: " Refund".tr,
                            style: TextStyle(
                              fontFamily: 'Ariel',
                              fontSize: getSmallestTextFontSIze(),
                              color: ColorConstants.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.staffRating);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.white,
                        boxShadow: [getBoxShadow()]
                    ), child: SvgPicture.asset('assets/images/star.svg'),
                  ),
                ),
                const SizedBox(width: 10,),
                Center(child: addText('Zoya', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal)),

                const Spacer(),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    addText('20/10/2022', getSmallTextFontSIze(), ColorConstants.lightTextColor, FontWeight.normal),
                    addText('09:00:30pm', getSmallestTextFontSIze(), ColorConstants.lightTextColor, FontWeight.normal),


                  ],
                )



              ],
            ),
          ),

          Divider(
            height: 3.h,
          ),

        ],
      ),
    );
  }

  Widget buildCardDetailsDialog(BuildContext context){
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
                children: [
                  const Spacer(),
                  addText('Card Details', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  const Spacer(),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: getEditTextDecoration(),
                child: addEditText2(controller.cardNumberController!, 'Card Number'),
              ),
              SizedBox(height: 1.h,),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: getEditTextDecoration(),
                        child: Row(
                          children: [
                            Flexible(child: addEditText2(controller.cardExpiryController!, 'Expiry')),
                            SvgPicture.asset('assets/images/ic_calendar.svg',height: getHeadingTextFontSIze(),)
                          ],
                        ),
                      )),
                  const SizedBox(width: 10,),
                  Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: getEditTextDecoration(),
                        child: Row(
                          children: [
                            Flexible(child: addEditText2(controller.cardExpiryController!, 'CVV')),
                            GestureDetector(
                                onTap: ()=> showPicker(context),
                                child: SvgPicture.asset('assets/images/ic_calendar.svg',height: getHeadingTextFontSIze(),))
                          ],
                        ),
                      ))
                ],
              ),
              SizedBox(height: 1.h,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: getEditTextDecoration(),
                child: addEditText2(controller.cardNumberController!, 'Card holder name'),
              ),
              SizedBox(height: 1.h,),


              SizedBox(
                height: 2.h,
              ),

              GestureDetector(
                onTap: (){
                  Get.back();
                  Get.dialog(const SuccessDialog(message: 'Order successfully placed!',));

                },
                child: CircularBorderedButton(width: 50.w, text: 'PAY'),
              )


            ],
          ),
        ),
      ),
    );
  }


  Widget buildWalletDialog(BuildContext context){
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
                children: [

                  addText('Wallet', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  const Spacer(),
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
                margin: const EdgeInsets.symmetric(horizontal: 0),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    boxShadow: [getLightBoxShadow()],
                    border: Border.all(color: ColorConstants.primaryColor),
                    color: ColorConstants.primaryColorLight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    SvgPicture.asset('assets/images/ic_coins.svg',width: 15.w,),

                    Column(
                      children: [
                        SizedBox(height: 1.h,),
                        addText('Balance', getLargeTextFontSIze(), ColorConstants.primaryColor, FontWeight.w400),
                        SizedBox(height: 1.h,),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "213".tr,
                                  style: TextStyle(
                                      fontFamily: 'Ariel',
                                      fontSize: getLargeTextFontSIze()*1.2,
                                      color: ColorConstants.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 3
                                  )),
                              TextSpan(
                                text: "AED".tr,
                                style: TextStyle(
                                  fontFamily: 'Ariel',
                                  fontSize: getLargeTextFontSIze()*1.2,
                                  color: ColorConstants.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h,),
                      ],
                    ),

                    GestureDetector(
                      onTap: (){
                        Get.dialog(buildCardDetailsDialog(context));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryColorLight,
                            shape: BoxShape.circle,
                            boxShadow: [getBoxShadow()],
                            border: Border.all(color: ColorConstants.primaryColor)
                        ),child: const Icon(Icons.add,color: ColorConstants.primaryColor,size: 50,),
                      ),
                    )

                  ],
                ),
              ),


              SizedBox(
                height: 2.h,
              ),

              GestureDetector(
                onTap: (){
                  Get.back();
                  Get.dialog(const SuccessDialog(message: 'Order successfully placed!',));

                },
                child: CircularBorderedButton(width: 50.w, text: 'PAY'),
              )


            ],
          ),
        ),
      ),
    );
  }


}
