import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/orders/orders_controller.dart';
import 'package:star_shop/app/routes/app_routes.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/direction_view.dart';
import '../../../common/utils.dart';

class DeliveryAddressView extends GetView<OrdersController>{
  const DeliveryAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Delivery Address',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addText('Delivery Address', getHeadingTextFontSIze(), ColorConstants.black, FontWeight.bold),
            SizedBox(height: 1.h,),
            Row(
              children: [
                SvgPicture.asset('assets/images/pin.svg',height: getHeadingTextFontSIze(),),
                const SizedBox(width: 5,),
                addText('Location :', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                addText(' Lia Tower; P.O. Box 901; Abu Dhabi', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold)
              ],
            ),
            SizedBox(height: 2.h,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  // boxShadow: [getBoxShadow()],
                  border: Border.all(color: ColorConstants.borderColor2,width: 1),
                  color: ColorConstants.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        border: Border.all(color: ColorConstants.primaryColor)
                    ), child: SvgPicture.asset('assets/images/house.svg'),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.primaryColor),
                              borderRadius: getCustomBorderRadius(15),
                              color: ColorConstants.white),
                          child: SvgPicture.asset('assets/images/user.svg',height: getLargeTextFontSIze()*1.3,),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            buildInfoItems('Guardian', 'Slim Khan'),
                            buildInfoItems('Relation', 'Father'),


                          ],
                        ),

                        const Spacer(),

                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.messageView);
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/images/ic_chat.svg'),
                              const SizedBox(height: 5,),
                              addText('Chat', getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal)
                            ],
                          ),
                        ),

                        SizedBox(width: 5.w,),

                        GestureDetector(
                          onTap: (){
                            Get.to(const DirectionView());
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/images/ic_map.svg'),
                              const SizedBox(height: 5,),
                              addText('Direction', getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal)
                            ],
                          ),
                        ),




                      ],
                    ),
                  ),
                  Divider(
                    height: 3.h,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        buildInfoItems('Sector', 'Dubai'),
                        buildInfoItems('Area', 'Jumeriah'),
                        buildInfoItems('Street', '53 B'),
                        buildInfoItems('Building/Villa', 'KM Tower'),
                        buildInfoItems('Flat/Villa No', '123456'),
                        buildInfoItems('Landmark', 'Jumeriah'),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildInfoItems('Mobile No', '0503664321  '),
                            GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(
                                    const ClipboardData(text: "0503664321"));
                                showToast('Number copied to clipboard');
                              },
                              child: Icon(
                                Icons.copy,
                                color: ColorConstants.primaryColor,
                                size: getHeadingTextFontSIze(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildInfoItems('Landline No', 'L043674882  '),
                            GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(
                                    const ClipboardData(text: "0503664321"));
                                showToast('Number copied to clipboard');
                              },
                              child: Icon(
                                Icons.copy,
                                color: ColorConstants.primaryColor,
                                size: getHeadingTextFontSIze(),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 2.h,)

                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}