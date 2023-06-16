import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/orders/order_canteen_controller.dart';
import 'package:star_shop/common/bordered_button.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/utils.dart';

import '../../../../common/app_header.dart';

class CanteenOrderDetailView extends GetView<OrderCanteenController> {
  const CanteenOrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Order Details',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInfoItems('Order ID', '#45689 (Break)'),
              SizedBox(height: 1.h,),
              addText('Items to be Serve', getNormalTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(height: 1.h,),
              ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildItem(index, context);
                },
              ),
              SizedBox(height: 2.h,),
              addText('Serve to', getNormalTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(height: 2.h,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor2)
                ), child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: getCurvedBorderRadius(),
                          border: Border.all(color: ColorConstants.primaryColor)
                      ),child: SvgPicture.asset('assets/images/user.svg',height: getLargeTextFontSIze()*2,),
                  ),
                  SizedBox(width: 5.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText('Romaan', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                      SizedBox(height: 1.h,),
                      buildInfoItems('ID', '#35463456')
                    ],
                  )


                ],
              ),
              ),
              SizedBox(height: 2.h,),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Serving Place - ".tr,
                        style: TextStyle(
                          fontFamily: 'Ariel',
                          fontSize: getSubheadingTextFontSIze(),
                          color: ColorConstants.black,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                      text: "Canteen".tr,
                      style: TextStyle(
                        fontFamily: 'Ariel',
                        fontSize: getSubheadingTextFontSIze(),
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 4.h,
              ),
              buildAmount('Sub Total', '17 AED'),
              SizedBox(height: 2.h,),
              buildAmount('Taxes (5%)', '2 AED'),
              SizedBox(height: 2.h,),
              buildAmount('Grand Total', '19 AED'),
              SizedBox(height: 3.h,),
              Container(
                width: 100.w,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.borderColor2),
                  borderRadius: getCurvedBorderRadius()
                ), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText('Update Order', getSubheadingTextFontSIze(), ColorConstants.black, FontWeight.bold),
                  SizedBox(height: 2.h,),
                  buildOrderDetailItem('Paid and Confirmed', 'July 3, 10:30AM'),
                  SizedBox(height: 1.h,),
                  buildOrderDetailItem('Preparing', 'July 3, 10:30AM'),
                  SizedBox(height: 1.h,),
                  buildOrderDetailItem('Served', 'July 3, 10:30AM'),
                ],
              ),
              ),
              SizedBox(height: 2.h,),
              Center(
                child: GestureDetector(
                  onTap: (){},
                  child: BorderedButton(width: 50.w, text: 'UPDATE'),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(int index,BuildContext context){
    return Container(
      width: 100.w,
      padding: const  EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: getCurvedBorderRadius(),
          boxShadow: [getDeepBoxShadow()],
          color: ColorConstants.white
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: getCurvedBorderRadius(),
                //  child: Image.network('https://picsum.photos/id/${Random().nextInt(100)}/200/300',width: 20.w,height: 20.w,fit: BoxFit.cover,)),
                  child: Image.asset('assets/images/im_canteen_0${index+1}.png',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
              SizedBox(width: 5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.h,),
                  addText('Mango Juice', getSubheadingTextFontSIze(), ColorConstants.black, FontWeight.w500),
                  SizedBox(height: 0.5.h,),
                  addText('4 AED', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }

  Widget buildAmount(String title,String amount){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addText(title, getNormalTextFontSIze(), ColorConstants.black, FontWeight.w500),
        addText(amount, getNormalTextFontSIze()+1, ColorConstants.primaryColor, FontWeight.bold),
      ],
    );
  }

  Widget buildOrderDetailItem(String title,String date){
    return Row(
      children: [
        addText(title, getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal),
        const Spacer(),
        addText(date, getSmallTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
        SizedBox(width: 3.w,),
        Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorConstants.primaryColor)
          ),
          child: Icon(Icons.check,color: ColorConstants.primaryColor,size: getSubheadingTextFontSIze(),),
        )
      ],
    );
  }


}
