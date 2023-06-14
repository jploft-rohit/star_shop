import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../common/bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/auth_controller.dart';
import '../../routes/app_routes.dart';

class VerificationView extends GetView<AuthController>{
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColorLight,
      body: SafeArea(
          child: Column(
            children: [
              Flexible(
                  flex: 2,
                  child: Center(
                    child: addText('SMS Verification', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.w400),
                  )),
              Flexible(
                  flex: 12,
                  child: Container(
                    padding: EdgeInsets.only(top: 8.h, left: 7.w, right: 7.w),
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: ColorConstants.white,
                        boxShadow: [getDeepBoxShadow()]),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h,),
                        Align(
                            alignment: Alignment.topLeft,
                            child: addText("OTP Sent!", getLargeTextFontSIze(),
                                ColorConstants.black, FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            addText(
                                "Please enter the 4-digit OTP sent to ",
                                getNormalTextFontSIze(),
                                ColorConstants.gretTextColor,
                                FontWeight.normal),
                            // addText(
                            //     "05x-xxxxxxxxx",
                            //     getNormalTextFontSIze(),
                            //     ColorConstants.gretTextColor,
                            //     FontWeight.normal)

                          ],
                        ),


                        Row(
                          children: [
                            // addText(
                            //     "Please enter the 4-digit OTP sent to ",
                            //     getNormalTextFontSIze(),
                            //     ColorConstants.gretTextColor,
                            //     FontWeight.normal),
                            addText(
                                "05x-xxxxxxxxx",
                                getNormalTextFontSIze(),
                                ColorConstants.gretTextColor,
                                FontWeight.normal)

                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),

                        OTPTextField(
                          length: 4,
                          width: 100.w,
                          fieldWidth: 16.w,
                          // textFieldAlignment: MainAxisAlignment.values[MainAxisAlignment.start, MainAxisAlignment.start, MainAxisAlignment.end],
                          // margin: const EdgeInsets.only(right: 0),
                          fieldStyle: FieldStyle.box,
                          contentPadding: const EdgeInsets.symmetric(vertical: 15),
                          outlineBorderRadius: 8,
                          otpFieldStyle: OtpFieldStyle(
                            focusBorderColor: ColorConstants.primaryColor,
                          ),
                          onChanged:(value) {},
                          keyboardType: TextInputType.number,
                          style:  TextStyle(
                              color: ColorConstants.primaryColor,
                              fontSize: getLargeTextFontSIze()
                          ),
                          onCompleted: (pin) {
                            controller.enteredOtp.value = pin;
                          },
                        ),

                        SizedBox(
                          height: 4.h,
                        ),

                        GestureDetector(
                          onTap: () {

                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Didn't receive OTP? ".tr,
                                    style: TextStyle(
                                      fontFamily: 'Ariel',
                                      fontSize: getSubheadingTextFontSIze(),
                                      color: ColorConstants.black,
                                      fontWeight: FontWeight.w500,
                                    )),
                                TextSpan(
                                  text: "Send again.".tr,
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
                        ),

                        SizedBox(height: 8.h,),

                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.accountActivationView);
                          },
                          child: BorderedButton(width: 50.w, text: 'SUBMIT'),
                        )




                      ],
                    ),
                  ))
            ],
          )),
    );
  }

}