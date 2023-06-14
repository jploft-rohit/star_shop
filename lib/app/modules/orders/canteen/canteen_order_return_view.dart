import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/orders/order_canteen_controller.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/bordered_button.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/utils.dart';

import '../../../../common/app_header.dart';

class CanteenOrderReturnView extends GetView<OrderCanteenController> {
  const CanteenOrderReturnView({super.key});

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
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.messageView);
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/images/ic_chat.svg',height: getHeadingTextFontSIze(),),
                              addText('Chats', getSmallestTextFontSIze()-1, ColorConstants.black, FontWeight.normal)
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
                  addText('Returned Items', getNormalTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),

                ],
              ),
              ListView.builder(
                itemCount: 2,
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
                                addText('Mango Juice', getNormalTextFontSIze(),
                                    ColorConstants.black, FontWeight.normal),
                                const SizedBox(
                                  height: 5,
                                ),
                                addText('15 AED', getNormalTextFontSIze(),
                                    ColorConstants.primaryColor, FontWeight.bold),
                                const SizedBox(
                                  height: 5,
                                ),
                                buildInfoItems('Reason', 'Taste not good')
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
                child: GestureDetector(
                  onTap: () {

                  },
                  child: BorderedButton(width: 70.w, text: 'ACCEPT RETURN',borderRadius: getCustomBorderRadius(15),),
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
