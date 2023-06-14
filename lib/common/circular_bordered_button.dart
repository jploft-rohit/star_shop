import 'package:flutter/material.dart';
import 'package:star_shop/common/utils.dart';

import 'color_constants.dart';


// ignore: must_be_immutable
class CircularBorderedButton extends StatelessWidget {
  double width;
  String text;

  CircularBorderedButton({Key? key, required this.width, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: ColorConstants.primaryColorLight,
          boxShadow: [getDeepBoxShadow()],
          border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
          borderRadius: getBorderRadiusCircular()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
        child: Center(
          child: addText(text, getSubheadingTextFontSIze(),
              ColorConstants.primaryColor, FontWeight.bold),
        ),
      ),
    );
  }
}
