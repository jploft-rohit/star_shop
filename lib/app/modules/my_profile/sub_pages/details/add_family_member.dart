import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../common/app_header.dart';
import '../../../../../common/bordered_button.dart';
import '../../../../../common/color_constants.dart';
import '../../../../../common/utils.dart';
import '../../../../controller/my_profile_controller.dart';

class AddFamilyMember extends GetView<MyProfileController> {
  const AddFamilyMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Add Family Member',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildInputField('Name', controller.addFamilyNameController!),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText('Relation', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.w700),
                Container(
                  width: 65.w,
                  decoration: getEditTextDecoration(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: buildDropDown(),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('DOB', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.w700),

                    const Icon(Icons.calendar_month,
                        color: ColorConstants.gretTextColor)
                  ],
                ),
                Container(
                  width: 65.w,
                  decoration: getEditTextDecoration(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: GestureDetector(
                    onTap: () {},
                    child: addText(
                        controller.addFamilyDOB.value,
                        getNormalTextFontSIze(),
                        ColorConstants.gretTextColor,
                        FontWeight.normal),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            buildInputField('Mobile No', controller.addFamilyMobileController!),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText('Upload\nID', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.w700),
                Container(
                  width: 65.w,
                  decoration: getEditTextDecoration(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addText(
                            controller.addFamilyUploadId.value,
                            getNormalTextFontSIze(),
                            ColorConstants.gretTextColor,
                            FontWeight.normal),
                        const Icon(Icons.cloud_upload_outlined)
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('ID Expiry\nDate', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.w700),
                    const Icon(Icons.calendar_month,
                        color: ColorConstants.gretTextColor)
                  ],
                ),
                Container(
                  width: 65.w,
                  decoration: getEditTextDecoration(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: GestureDetector(
                    onTap: () {},
                    child: addText(
                        controller.addFamilyIDExpiryDate.value,
                        getNormalTextFontSIze(),
                        ColorConstants.gretTextColor,
                        FontWeight.normal),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            GestureDetector(
              onTap: () {},
              child: BorderedButton(
                width: 50.w,
                text: 'SUBMIT',
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget buildDropDown() {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              items: controller.relationItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: getNormalTextFontSIze(),
                            fontWeight: FontWeight.normal,
                            color: ColorConstants.gretTextColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: controller.addFamilyRelation.value,
              onChanged: (value) {
                controller.addFamilyRelation.value = value.toString();
              },
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 25,
              ),
              iconSize: 14,
              iconEnabledColor: ColorConstants.gretTextColor,
              iconDisabledColor: Colors.grey,
              buttonWidth: 65.w,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: 78.w,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              dropdownElevation: 1,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              // offset: const Offset(-20, 0),
            ),
          )),
    );
  }
}
