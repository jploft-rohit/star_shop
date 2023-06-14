import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/cardAndTag_cart_controller.dart';

import '../../../common/app_header.dart';
import '../../../common/bordered_button.dart';
import '../../../common/circular_bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/success_dialog.dart';
import '../../../common/utils.dart';


class CardAndTagCartView extends GetView<CardAndTagCartController>{
  const CardAndTagCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Cart',
          )),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: addText('Items', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal)),
              ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ColorConstants.white,
                        borderRadius: getCurvedBorderRadius(),
                        boxShadow: [getDeepBoxShadow()]
                    ),
                    child: Row(
                      children: [

                        // ClipRRect(
                        //   borderRadius: getCurvedBorderRadius(),
                        //   child: Image.network('https://picsum.photos/id/${(index*8)}/200/300',width: 20.w,height: 20.w,fit: BoxFit.cover,),
                        // ),
                        ClipRRect(
                          borderRadius: getCurvedBorderRadius(),
                          child: Image.asset('assets/images/im_canteen_0${index+1}.png',width: 20.w,height: 20.w,fit: BoxFit.cover,),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText('NFC Tags', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                            const SizedBox(height: 5,),
                            addText('15 AED', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                            const SizedBox(height: 5,),

                            Row(

                              children: [

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: getCurvedBorderRadius(),
                                      border: Border.all(color: ColorConstants.primaryColor),
                                      boxShadow: [getDeepBoxShadow()],
                                      color: ColorConstants.primaryColorLight),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(width: 10,),
                                      GestureDetector(
                                        onTap: (){},
                                        child: addText('-', getNormalTextFontSIze()+8, ColorConstants.primaryColor, FontWeight.bold),
                                      ),
                                      const SizedBox(width: 10,),
                                      addText('2', getSmallTextFontSIze()+6, ColorConstants.primaryColor, FontWeight.bold),
                                      const SizedBox(width: 10,),
                                      GestureDetector(
                                        onTap: (){},
                                        child: addText('+', getNormalTextFontSIze()+8, ColorConstants.primaryColor, FontWeight.bold),
                                      ),
                                      const SizedBox(width: 10,),

                                    ],
                                  ),
                                ),

                                const Spacer(),
                                verticalDivider(),
                                const Spacer(),
                                SvgPicture.asset('assets/images/ic_delete.svg',color: Colors.red,),
                                SizedBox(width: 5,),
                                InkWell(child: addText('Remove', getNormalTextFontSIze(), Colors.red, FontWeight.normal),onTap: (){
                                  showremoveSuccessfulDialogue(context);
                                },),
                                const Spacer(),
                              ],
                            )



                          ],
                        ))

                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 3.h,),

              Container(
                width: 100.w,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    border: Border.all(color: ColorConstants.borderColor2)
                ), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText(' Select Shipping', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                  SizedBox(height: 1.h,),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   width: 40.w,
                      //   child: RadioListTile(
                      //     contentPadding: EdgeInsets.zero,
                      //     visualDensity: const VisualDensity(
                      //         horizontal: VisualDensity.minimumDensity,
                      //         vertical: VisualDensity.minimumDensity),
                      //     title: Text("Home Delivery".tr, style: TextStyle(fontSize: getSmallTextFontSIze(),fontWeight: FontWeight.normal),),
                      //     value: "Home Delivery",
                      //     dense: true,
                      //     groupValue: controller.friendsRadioValue.value,
                      //     activeColor: ColorConstants.primaryColor,
                      //     onChanged: (value){
                      //       controller.friendsRadioValue.value = value.toString();
                      //     },
                      //   ),
                      // ),
                      //
                      // SizedBox(
                      //   width: 40.w,
                      //   child: RadioListTile(
                      //     visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      //     contentPadding: const EdgeInsets.all(0),
                      //     title: Text("Pick-up from school.".tr,style: TextStyle(fontSize: getSmallTextFontSIze(),fontWeight: FontWeight.normal)),
                      //     value: "Pick-up from school.",
                      //     dense: true,
                      //     groupValue: controller.friendsRadioValue.value,
                      //     activeColor: ColorConstants.primaryColor,
                      //     onChanged: (value){
                      //       controller.friendsRadioValue.value = value.toString();
                      //     },
                      //   ),
                      // ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: "Home Delivery",
                            groupValue: controller.friendsRadioValue.value,
                            activeColor: ColorConstants.primaryColor,
                            visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: VisualDensity.minimumDensity),
                            onChanged: (value){
                              controller.friendsRadioValue.value = value.toString();
                            },
                          ),
                          Text("Home Delivery".tr, style: TextStyle(fontSize: getSmallTextFontSIze(),fontWeight: FontWeight.normal),)
                        ],
                      ),

                      const SizedBox(width: 10,),

                      Row(
                        children: <Widget>[
                          Radio(
                            value: "Pick-up from school.",
                            groupValue: controller.friendsRadioValue.value,
                            activeColor: ColorConstants.primaryColor,
                            visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: VisualDensity.minimumDensity),
                            onChanged: (value){
                              controller.friendsRadioValue.value = value.toString();
                            },
                          ),
                          Text("Pick-up from school.".tr,style: TextStyle(fontSize: getSmallTextFontSIze(),fontWeight: FontWeight.normal)),
                        ],
                      ),













                    ],
                  )),



                ],
              ),
              ),

              Obx(() => controller.friendsRadioValue.value == 'Home Delivery' ? Container() : SizedBox.shrink()),

              SizedBox(height: 3.h,),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    buildBill('Sub Total', '130 AED'),
                    SizedBox(height: 1.h,),
                    buildBill('Taxes (5%)', '6.5 AED'),
                    SizedBox(height: 1.h,),
                    buildBill('Shipping Charges', '0 AED'),
                    SizedBox(height: 1.h,),
                    buildBill('Grand Total', '136.5 AED'),
                    SizedBox(height: 3.h,),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [


                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          Get.dialog(buildCardDetailsDialog(context));
                        },
                        child: Container(
                          // width: width,
                          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0.w),
                          decoration: BoxDecoration(
                              color: ColorConstants.primaryColorLight,
                              boxShadow: [getDeepBoxShadow()],
                              border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
                              borderRadius: getCustomBorderRadius(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Center(
                              child: addText('PROCEED TO PAY', getSubheadingTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),


                    const SizedBox(width: 10,),

                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          Get.dialog(buildWalletDialog(context));
                        },
                        child: Container(
                          // width: width,
                          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0.w),
                          decoration: BoxDecoration(
                              color: ColorConstants.primaryColorLight,
                              boxShadow: [getDeepBoxShadow()],
                              border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
                              borderRadius: getCustomBorderRadius(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Center(
                              child: addText('WALLET PAY', getSubheadingTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    )







                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget buildBill(String title,String amount){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addText(title, getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
        addText(amount, getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
      ],
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
                            GestureDetector(
                                onTap: ()=> showPicker(context),
                                child: SvgPicture.asset('assets/images/ic_calendar.svg',height: getHeadingTextFontSIze(),))
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
                            SvgPicture.asset('assets/images/ic_info.svg',height: getHeadingTextFontSIze(),)
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
                       Get.dialog(buildMoneyPopup(context));
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
  
  
  Widget buildMoneyPopup(BuildContext context){




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

                  addText('Top up', getSubheadingTextFontSIze(),
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
                child: addEditText2(controller.amountController!, 'AED 10'),
              ),
              SizedBox(height: 1.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.amountController?.text = 'AED 10';
                        controller.amountText.value = 'AED 10';
                      },
                      child: buildChip('+AED10'),
                    ),
                    SizedBox(width: 2.w,),
                    GestureDetector(
                      onTap: (){
                        controller.amountController?.text = 'AED 20';
                        controller.amountText.value = 'AED 20';
                      },
                      child: buildChip('+AED20'),
                    ),
                    SizedBox(width: 2.w,),
                    GestureDetector(
                      onTap: (){
                        controller.amountController?.text = 'AED 30';
                        controller.amountText.value = 'AED 30';
                      },
                      child: buildChip('+AED30'),
                    ),
                    SizedBox(width: 2.w,),
                    GestureDetector(
                      onTap: (){
                        controller.amountController?.text = 'AED 40';
                        controller.amountText.value = 'AED 40';
                      },
                      child: buildChip('+AED40'),
                    ),
                    SizedBox(width: 2.w,),
                    GestureDetector(
                      onTap: (){
                        controller.amountController?.text = 'AED 50';
                        controller.amountText.value = 'AED 50';
                      },
                      child: buildChip('+AED50'),
                    ),


                  ],
                ),
              ),

              SizedBox(
                height: 2.h,
              ),

              GestureDetector(
                onTap: (){
                  Get.dialog(buildCardDetailsDialog(context));
                },
                child: Obx(() => CircularBorderedButton(width: 50.w, text: 'TOP UP ${controller.amountText.value.toString()}')),
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget buildChip(String text){
    return Chip(label: addText(text, getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
      backgroundColor: ColorConstants.primaryColorLight,
      padding: EdgeInsets.zero,
      side: const BorderSide(color: ColorConstants.primaryColor),
    );
  }



}