import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../../common/circular_bordered_button.dart';
import '../../../../../../../common/color_constants.dart';
import '../../../../../../../common/success_dialog.dart';
import '../../../../../../../common/utils.dart';
import '../../../../../../controller/purchase_controller.dart';

class SuccessDialog extends StatefulWidget {
  final String message;

  const SuccessDialog({Key? key, required this.message}) : super(key: key);

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
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
              SizedBox(
                height: 2.h,
              ),
              addText(widget.message, getHeadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  // Get.back();
                  // Get.back();
                },
                child: CircularBorderedButton(width: 30.w, text: 'OK'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
