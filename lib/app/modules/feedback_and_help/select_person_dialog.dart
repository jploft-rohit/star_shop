import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/feedback_controller.dart';

import '../../../common/circular_bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/raise_complain_controller.dart';


class SelectPersonDialog extends GetView<FeedbackController>{
  const SelectPersonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          constraints: BoxConstraints(maxHeight: 80.h),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
          decoration:  BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: ()=> Get.back(),
                  child: const Icon(Icons.close,color: ColorConstants.borderColor),
                ),
              ),
              addText('Select Person', getSubheadingTextFontSIze(), ColorConstants.black, FontWeight.bold),
              SizedBox(height: 2.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: getCustomBorderRadius(15),
                    border: Border.all(color: ColorConstants.borderColor2)
                ), child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      SvgPicture.asset('assets/images/ic_teacher.svg',height: getHeadingTextFontSIze()),
                      const SizedBox(width: 10),
                      Expanded(child: buildDropDown(controller.roleList, controller.selectedRole, 'Select Role'))
                    ],
                  ),
                  const Divider(
                    height: 0,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      Icon(Icons.search,size: getHeadingTextFontSIze(),),
                      const SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: addText('Search By ID', getNormalTextFontSIze(), ColorConstants.lightTextColor, FontWeight.normal),
                      )
                    ],
                  )
                ],
              ),
            ),




              SizedBox(height: 2.h),
              Expanded(child: ListView.builder(
                itemCount: 16,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){},
                    child:  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorConstants.borderColor2,width: 1),
                          borderRadius: getBorderRadius(),
                          color: index.isOdd? ColorConstants.white : ColorConstants.primaryColorLight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorConstants.primaryColor,width: 1),
                                borderRadius: getBorderRadius(),
                                color: ColorConstants.white),
                            child: SvgPicture.asset('assets/images/user.svg',height: getLargeTextFontSIze()*1.5,),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText('Roma(Star)', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                              addText('#646537', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w500),
                            ],
                          ),

                          const Spacer(),

                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: ColorConstants.white,width: 2),
                                  shape: BoxShape.circle,
                                  boxShadow: [getDeepBoxShadow()],
                                  color: index.isEven ? ColorConstants.primaryColor : ColorConstants.borderColor2
                              ), child: Icon(Icons.check,color: ColorConstants.white,size: getSubheadingTextFontSIze(),),
                            ),
                          ),

                          const SizedBox(
                            width: 20,
                          ),


                        ],
                      ),
                    ),
                  );
                },
              )),
              SizedBox(height: 2.h,),
              GestureDetector(
                onTap: (){},
                child: CircularBorderedButton(width: 40.w, text: 'SAVE'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropDown(List<String> list,RxString selectedValue,String hint) {
    return DropdownButtonHideUnderline(
      child: Obx(() => DropdownButton2(
        buttonPadding: const EdgeInsets.only(right: 20),
        hint: Text(
          hint.tr,
          style: TextStyle(
              fontSize: getSmallTextFontSIze(),
              color: ColorConstants.gretTextColor),
        ),
        items: list.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontSize: getNormalTextFontSIze(),
            ),
          ),
        )).toList(),
        value: selectedValue.value.isNotEmpty
            ? selectedValue.value
            : null,
        onChanged: (value) {
          selectedValue.value = value as String;
        },
        iconSize: 30,
        icon: const Icon(Icons.arrow_drop_down,color: ColorConstants.lightGreyColor,),
        buttonWidth: 100.w,
        dropdownElevation: 1,
        dropdownDecoration: BoxDecoration(
          color: ColorConstants.white,
          boxShadow: [getDeepBoxShadow()],
        ),
        iconEnabledColor: ColorConstants.gretTextColor,
        iconDisabledColor: Colors.grey,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: 60.w,
        dropdownPadding: null,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
      )),
    );
  }

}