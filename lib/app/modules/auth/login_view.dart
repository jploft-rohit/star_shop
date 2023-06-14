import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/auth_controller.dart';
import '../../routes/app_routes.dart';


class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

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
                    child: addText('Login', getLargeTextFontSIze(),
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
                        Align(
                            alignment: Alignment.topLeft,
                            child: addText("Welcome", getLargeTextFontSIze(),
                                ColorConstants.black, FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: addText(
                                "Please login to your account",
                                getNormalTextFontSIze(),
                                ColorConstants.gretTextColor,
                                FontWeight.normal)),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: getEditTextDecoration(),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: ColorConstants.primaryColor,
                                size: getLargeTextFontSIze() * 1.2,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              addEditText(controller.loginTextController!,
                                  '05x-xxxxxxxxx    '),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.verificationView);
                          },
                          child: BorderedButton(width: 50.w, text: 'SEND OTP'),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        addText('OR', getHeadingTextFontSIze(),
                            ColorConstants.black, FontWeight.bold),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                              'assets/images/ic_face_scan.svg',
                              height: 10.h,
                            ),
                            // SizedBox(
                            //     height: 10.h,
                            //     child: const VerticalDivider(
                            //       color: ColorConstants.lightGreyColor,
                            //       thickness: 1,
                            //     )),
                            // SvgPicture.asset(
                            //   'assets/images/ic_thumb.svg',
                            //   height: 10.h,
                            // )
                          ],
                        ),

                        const Spacer(),

                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.accountActivationView),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Don’t have a account? ".tr,
                                    style: TextStyle(
                                      fontFamily: 'Ariel',
                                      fontSize: getNormalTextFontSIze(),
                                      color: ColorConstants.black,
                                      fontWeight: FontWeight.normal,
                                    )),
                                TextSpan(
                                  text: "Activate Account".tr,
                                  style: TextStyle(
                                    fontFamily: 'Ariel',
                                    fontSize: getNormalTextFontSIze(),
                                    color: ColorConstants.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 2.h,)


                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
