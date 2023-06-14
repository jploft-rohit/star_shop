import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/orders/order_stationary_controller.dart';
import 'package:star_shop/app/routes/app_routes.dart';

import '../../../../common/app_header.dart';
import '../../../../common/bordered_button.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';

class StationaryOrderDetailView extends GetView<OrderStationaryController>{
  const StationaryOrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Order Details',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInfoItems('Order ID', '#45689'),
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
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Order Type - ".tr,
                        style: TextStyle(
                          fontFamily: 'Ariel',
                          fontSize: getSubheadingTextFontSIze(),
                          color: ColorConstants.black,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                      text: "Delivery".tr,
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
              SizedBox(height: 2.h,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.deliveryAddressView);
                },
                child: Container(
                  width: 100.w,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: getCurvedBorderRadius(),
                      border: Border.all(color: ColorConstants.borderColor2)
                  ), child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText('Delivery Address', getSubheadingTextFontSIze(), ColorConstants.black, FontWeight.w500),
                    SizedBox(height: 1.h,),
                    Row(
                      children: [

                        SvgPicture.asset('assets/images/pin.svg',height: getHeadingTextFontSIze(),),
                        const SizedBox(width: 10,),
                        Expanded(child: addText('Liwa Tower; P.O. Box 901; Abu Dhabi', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold)),
                        SvgPicture.asset('assets/images/ic_map.svg',height: getHeadingTextFontSIze(),),

                      ],
                    )
                  ],
                ),
                ),
              ),
              SizedBox(height: 2.h,),
              buildAmount('Sub Total', '17 AED'),
              SizedBox(height: 2.h,),
              buildAmount('Taxes (5%)', '2 AED'),
              SizedBox(height: 2.h,),
              buildAmount('Shipping Charges', '17 AED'),
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
                  // SizedBox(height: 1.h,),
                  // buildOrderDetailItem('Packed', 'July 3, 10:30AM'),
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
    return FadeInUp(
      duration: Duration(milliseconds: 200*(index+1)),
      child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: getCurvedBorderRadius(),
                  //  child: Image.network('https://picsum.photos/id/${Random().nextInt(100)}/200/300',width: 20.w,height: 20.w,fit: BoxFit.cover,)),
                    child: Image.asset('assets/images/im_stationary_0${index+1}.png',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoItems('Name', 'Notebook'),
                    buildInfoItems('Price', '15 AED'),
                    Row(
                      children: [
                        buildInfoItems('Qty', '2'),
                        const SizedBox(width: 5,),
                        verticalDivider(),
                        const SizedBox(width: 5,),
                        buildInfoItems('Total', '30 AED')
                      ],
                    )
                  ],
                )
              ],
            ),

          ],
        ),
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