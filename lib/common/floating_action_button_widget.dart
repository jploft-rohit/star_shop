import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'color_constants.dart';
import 'utils.dart';

class BaseFloatingActionButton extends StatelessWidget {
  Function() onTap;
  String floating_text;
  final bool iscart;
  final bool isCalendar;
  final String cartitemcount;
  BaseFloatingActionButton({Key? key,required this.onTap,required this.floating_text,this.iscart=false,this.cartitemcount="",this.isCalendar=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: iscart?
      SizedBox(
        height: 7.h,
        width: 8.h,
        child: Stack(
          children: [
            Card(
              elevation: 3,
              color: ColorConstants.primaryColorLight,
              shape: RoundedRectangleBorder(
                  borderRadius: getCustomBorderRadius(50),
                  side: const BorderSide(width: 1,color: ColorConstants.primaryColor)
              ),
              child: Padding(
                padding: EdgeInsets.all(1.5.h),
                child: SvgPicture.asset("assets/images/cart.svg",height: 3.h,width: 3.h,),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 2.h,
                width: 2.h,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  color: ColorConstants.primaryColor,
                ),
                alignment: Alignment.center,
                child: addText(cartitemcount, 14, Colors.white, FontWeight.w700),
              ),
            )
          ],
        ),
      )
          :
      SizedBox(
        height: 12.h,
        width: 9.h,
        child: Column(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: getCustomBorderRadius(50),
                  side: const BorderSide(color: ColorConstants.primaryColor,width: 1)
              ),
              color: ColorConstants.primaryColorLight,
              child: Padding(
                padding: EdgeInsets.all(1.5.h),
                child: SvgPicture.asset(isCalendar?"assets/images/ic_calendar.svg":"assets/images/add.svg",height: 3.h,width: 3.h,),
              ),
            ),
            addAlignedText(
                floating_text, getSmallTextFontSIze(),ColorConstants.primaryColor, FontWeight.normal)
          ],
        ),
      ),
    );
  }
}
