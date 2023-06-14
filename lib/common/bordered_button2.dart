import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/color_constants.dart';

import 'utils.dart';

// ignore: must_be_immutable
class BorderedButton2 extends StatelessWidget {
  double width;
  String text;
  double horizontalPadding;
  final BorderRadiusGeometry? borderRadius;

  BorderedButton2({Key? key, required this.width, required this.text,required this.horizontalPadding,this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // width: width,
          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: horizontalPadding),
          decoration: BoxDecoration(
              color: ColorConstants.primaryColorLight,
              boxShadow: [getDeepBoxShadow()],
              border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
              borderRadius: borderRadius ?? getCustomBorderRadius(19)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: addText(text, getSubheadingTextFontSIze(),
                  ColorConstants.primaryColor, FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
