import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/success_dialog.dart';

import '../../../../common/circular_bordered_button.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';
import '../../../controller/attendance_controller.dart';


class AbsentReasonDialog extends GetView<AttendanceController> {
  const AbsentReasonDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText('March 01, 2022', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
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
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 1,
                      child: addText('Reason : ', getNormalTextFontSIze(),
                          ColorConstants.black, FontWeight.bold)),
                  Flexible(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: getEditTextDecoration(),
                        child: buildLineEditText(
                            controller.reasonController!, 'Type here.....'),
                      )),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 1,
                      child: addText(
                          'Upload Evidence : ',
                          getNormalTextFontSIze(),
                          ColorConstants.black,
                          FontWeight.bold)),
                  Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 10,
                            ),
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            decoration: getEditTextDecoration(),
                            child: addText(
                                'Upload Document',
                                getNormalTextFontSIze(),
                                ColorConstants.black,
                                FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: addText(
                                'Photo Uploaded 132KB',
                                getSmallTextFontSIze() - 1,
                                ColorConstants.blue,
                                FontWeight.normal),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.dialog(const SuccessDialog(message: 'Reason Submitted'));
                },
                child: CircularBorderedButton(width: 40.w, text: 'SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
