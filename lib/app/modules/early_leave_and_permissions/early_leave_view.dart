import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/app_header.dart';
import '../../../common/bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/early_leave_controller.dart';


class EarlyLeaveView extends GetView<EarlyLeaveController>{
  const EarlyLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Early Leave',
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [


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
                          addText('Date :', getNormalTextFontSIze(),
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
                            horizontal: 20, vertical: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: addText('dd/mm/yyyy', getNormalTextFontSIze(),
                                  ColorConstants.gretTextColor, FontWeight.normal),
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              size: getLargeTextFontSIze() * 1.5,
                              color: ColorConstants.lightTextColor,
                            )
                          ],
                        ),
                      )),

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
                          addText('Leaving\nTime :', getNormalTextFontSIze(),
                              ColorConstants.black, FontWeight.bold),
                          SvgPicture.asset(
                            'assets/images/ic_time.svg',
                            height: getHeadingTextFontSIze(),
                            color: ColorConstants.black,
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
                        child: addText('hh:mm', getNormalTextFontSIze(),
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
                            controller.leaveReasonController!,
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
                showToast('Request Submitted');
              },
              child: BorderedButton(width: 50.w, text: 'SUBMIT'),
            )
          ],
        ),
      ),
    );
  }



}