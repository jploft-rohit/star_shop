import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/success_dialog.dart';

import '../../../common/app_header.dart';
import '../../../common/bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/leave_request_controller.dart';


class RequestLeave extends GetView<LeaveRequestController> {
  const RequestLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Leave Requests',
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [

            SizedBox(
              height: 2.h,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addText('Leave\nType :', getNormalTextFontSIze(),
                              ColorConstants.black, FontWeight.bold),

                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 8,
                      child: Container(
                        width: 100.w,
                        decoration: getEditTextDecoration(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 4),
                        child: buildLeaveTypeDropDown(),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addText('Leave\nStart :', getNormalTextFontSIze(),
                              ColorConstants.black, FontWeight.bold),
                          GestureDetector(
                            onTap: ()=>showPicker(context),
                            child: SvgPicture.asset(
                              'assets/images/fab_calendar.svg',
                              height: getHeadingTextFontSIze(),
                              color: ColorConstants.black,
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 8,
                      child: Container(
                        width: 100.w,
                        decoration: getEditTextDecoration(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: addText('dd/mm/yyyy', getNormalTextFontSIze(),
                            ColorConstants.gretTextColor, FontWeight.normal),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addText('Leave\nEnd :', getNormalTextFontSIze(),
                              ColorConstants.black, FontWeight.bold),
                          GestureDetector(
                            onTap: ()=>showPicker(context),
                            child: SvgPicture.asset(
                              'assets/images/fab_calendar.svg',
                              height: getHeadingTextFontSIze(),
                              color: ColorConstants.black,
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 8,
                      child: Container(
                        width: 100.w,
                        decoration: getEditTextDecoration(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: addText('dd/mm/yyyy', getNormalTextFontSIze(),
                            ColorConstants.gretTextColor, FontWeight.normal),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addText('Reason :', getNormalTextFontSIze(),
                              ColorConstants.black, FontWeight.bold),
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 8,
                      child: Container(
                        width: 100.w,
                        decoration: getEditTextDecoration(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: addEditText2(
                            controller.evidenceReasonController!,
                            'Type here.....'),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: getEditTextDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText('Upload file or Photo', getNormalTextFontSIze(),
                      ColorConstants.gretTextColor, FontWeight.normal),
                  SvgPicture.asset('assets/images/ic_upload.svg')
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            GestureDetector(
              onTap: () {
                Get.dialog(const SuccessDialog(message: 'Requested Submitted'));
              },
              child: BorderedButton(width: 50.w, text: controller.leaveRequestButtonText.value),
            )
          ],
        ),
      ),
    );
  }

  Widget buildLeaveTypeDropDown() {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              items: controller.leaveItems
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
              value: controller.selectedLeaveType.value,
              onChanged: (value) {
                controller.selectedLeaveType.value = value.toString();
              },
              icon: Icon(
                Icons.arrow_drop_down_rounded,
                size: getLargeTextFontSIze() * 1.5,
                color: ColorConstants.lightTextColor,
              ),
              iconSize: 14,
              iconEnabledColor: ColorConstants.gretTextColor,
              iconDisabledColor: Colors.grey,
              buttonWidth: 80.w,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight:50.h,
              dropdownWidth: 60.w,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              dropdownElevation: 1,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(-20, 0),
            ),
          )),
    );
  }
}
