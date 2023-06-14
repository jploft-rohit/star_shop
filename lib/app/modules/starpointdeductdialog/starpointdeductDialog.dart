import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/rating/points_added_success_dialog.dart';
import 'package:star_shop/common/circular_bordered_button.dart';

import '../../../common/color_constants.dart';
import '../../../common/utils.dart';

class StarPointDeductPop extends StatefulWidget {
  const StarPointDeductPop({Key? key}) : super(key: key);

  @override
  State<StarPointDeductPop> createState() => _StarPointDeductPopState();
}

class _StarPointDeductPopState extends State<StarPointDeductPop> {
  int maxSecond=60;
  int seconds = 60 ;
  Timer? timer;
  int tabIndex=1;
  void startTime(){
    timer?.cancel();
    seconds = 60;
    timer=Timer.periodic(Duration(seconds: 1), (timers) {

      if(seconds > 0)
      {
        setState(() {
          seconds--;
        });

      }
      else{
        timer?.cancel();
      }
    });

  }
  @override
  void initState() {
    startTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(onTap: (){Get.back();},
                  child: Icon(Icons.close)),
            ),
            addText("Star Points Deduct", 17,Colors.black, FontWeight.w700),
            SizedBox(height: 4.h,),
            Center(
              child: SizedBox(
                height: 20.h,
                width: 20.h,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: ColorConstants.primaryColorLight,
                      strokeWidth: 1.2.h,
                      value: seconds/maxSecond,
                      valueColor: AlwaysStoppedAnimation(ColorConstants.primaryColor),
                    ),
                    Center(
                      child: addText(seconds.toString(), 26, ColorConstants.primaryColor, FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    timer?.cancel();
                    Get.dialog(PointsDeductSuccessDialog());

                  },
                  child: CircularBorderedButton(width: 40.w, text: 'Confirm Deduction'),
                ),
                GestureDetector(
                  onTap: (){
                    timer?.cancel();
                    Get.back();
                    Get.back();
                  },
                  child: CircularBorderedButton(width: 40.w, text: 'Issue Resolve'),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}