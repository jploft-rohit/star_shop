import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/rules_controller.dart';
import '../../routes/app_routes.dart';


class CodeOfConductView extends GetView<RulesController>{
  const CodeOfConductView({super.key});

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
                  children: [

                    addText('Some of the highlights that the code of conduct entails:', getHeadingTextFontSIze(), ColorConstants.black, FontWeight.bold),
                    SizedBox(height: 2.h),
                    Text(
"""a. Education professionals should commit to protecting children from bullying, neglect, and exploitation.
b. Educational professionals should avoid disclosing confidential information about students and their families.
c. Education professionals must be aware of Emirati culture and traditions and highly regard the values of Islam.
d. Education professionals must refrain from smoking in the workplace and using unauthorized substances.
e. Education professionals must not discuss socially unacceptable behaviors like gender identity and homosexuality.""", style: TextStyle(fontSize: getNormalTextFontSIze(),color: ColorConstants.black,fontWeight: FontWeight.normal,height: 1.3),textAlign: TextAlign.start),
                    SizedBox(height: 4.h,),
                    addText('Code of Conduct for Workers in the General education Sector:', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                    SizedBox(height: 2.h,),
                    Text(
"""1. Encourage positive values in students, safeguard them against being drawn into ideas deemed unacceptable by UAE's society and promote the principles of tolerance and acceptance of others.
2. Encourage students to highly regard the UAE's journey of development and prosperity, and encourage them to actively participate in national activities and events.
3. Commit to protecting children from neglect, exploitation, bullying and all forms of abuse.
4. Avoid disclosing confidential information about the students and their families and avoid spreading false news and rumors. Refrain from committing any verbal or physical violence against students under all circumstances.
5. Demonstrate positive behavior in dealing with the parents and the community.
6. Respect and make yourself aware of the Emirati culture and traditions and highly regard the values of Islam.
7. Respect cultural, religious and ethnic diversity of the workplace, and refrain from committing any behavioral or verbal offenses against your colleagues, the educational institution and its employees.
8. Refrain from using, possessing or falling under the influence of any unauthorized substances, including smoking, in the workplace.
9. Refrain from spreading socially unacceptable behaviors and discussing gender identity, homosexuality or any other behavior deemed unacceptable to the UAE's society. 
10. Adhere to appropriate, non-revealing clothing, respecting the traditions of the UAE and showing a respectful image of workers in the educational sector.""", style: TextStyle(fontSize: getNormalTextFontSIze(),color: ColorConstants.black,fontWeight: FontWeight.normal,height: 1.3),textAlign: TextAlign.start),
                    SizedBox(height: 1.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => Checkbox(
                          checkColor: ColorConstants.primaryColor,
                          activeColor: ColorConstants.primaryColorLight,
                          value: controller.isRulesChecked.value,
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(width: 1.0, color: ColorConstants.primaryColor),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onChanged: (bool? value) {
                            controller.isRulesChecked.value = value??false;
                          },
                         ),
                        ),
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
                        Get.toNamed(Routes.baseView);
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