import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/rules_controller.dart';
import '../../routes/app_routes.dart';


class RulesView extends GetView<RulesController>{
  const RulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    addText('Responsibilities of School Bus Drivers& Supervisors:', getHeadingTextFontSIze(), ColorConstants.black, FontWeight.bold),
                    SizedBox(height: 1.h,),
                    Text(
"""a. Education professionals should commit to protecting children from bullying, neglect, and exploitation.
b. Educational professionals should avoid disclosing confidential information about students and their families.
c. Education professionals must be aware of Emirati culture and traditions and highly regard the values of Islam.
d. Education professionals must refrain from smoking in the workplace and using unauthorized substances.
e. Education professionals must not discuss socially unacceptable behaviors like gender identity and homosexuality.""", style: TextStyle(fontSize: getNormalTextFontSIze(),color: ColorConstants.black,fontWeight: FontWeight.normal,height: 1.3),textAlign: TextAlign.start),
                    SizedBox(height: 2.h),
                    addText('Aims and Principals', getSubheadingTextFontSIze(), ColorConstants.black, FontWeight.bold),
                    SizedBox(height: 1.h),
                    Text(
"""a. Education professionals should commit to protecting children from bullying, neglect, and exploitation.
b. Educational professionals should avoid disclosing confidential information about students and their families.
c. Education professionals must be aware of Emirati culture and traditions and highly regard the values of Islam.
d. Education professionals must refrain from smoking in the workplace and using unauthorized substances.
e. Education professionals must not discuss socially unacceptable behaviors like gender identity and homosexuality.""", style: TextStyle(fontSize: getNormalTextFontSIze(),color: ColorConstants.black,fontWeight: FontWeight.normal,height: 1.3),textAlign: TextAlign.start),

                    // SizedBox(height: 2.h,),
                    // addText('Rules'.tr, getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                    SizedBox(height: 3.h),
                    Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => SizedBox(
                          height: 3.h,
                          child: Checkbox(
                            checkColor: ColorConstants.primaryColor,
                            activeColor: ColorConstants.primaryColorLight,
                            value: controller.isRulesChecked.value,
                            side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(width: 1.0, color: ColorConstants.primaryColor,),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (bool? value) {
                              controller.isRulesChecked.value = value!;
                            },
                          ),
                        )),
                        Expanded(child: addText('I have read all the terms and responsibility guidelines and I agree to all of them.', getNormalTextFontSIze(), ColorConstants.black, FontWeight.w500))
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                color: ColorConstants.primaryColorLight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: ColorConstants.white,
                          border: Border.all(color: ColorConstants.borderColor),
                          borderRadius: getCurvedBorderRadius()
                        ),
                        child: addAlignedText('Decline', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.codeOfConductView);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: 40.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.primaryColor),
                            borderRadius: getCurvedBorderRadius()
                        ),
                        child: addAlignedText('Agree', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
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

}