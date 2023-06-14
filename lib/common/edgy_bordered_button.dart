import 'package:flutter/material.dart';
import 'package:star_shop/common/utils.dart';

import 'color_constants.dart';


// ignore: must_be_immutable
class EdgyBorderedButton extends StatelessWidget {
  double width;
  String text;
  final bool isActive;


  EdgyBorderedButton({Key? key, required this.width, required this.text,this.isActive=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: isActive?ColorConstants.primaryColorLight:Colors.white,
          boxShadow: [getDeepBoxShadow()],
          border: Border.all(color: isActive?ColorConstants.primaryColor:Color(0XFFBECADA), width: 1.5),
          borderRadius: getEdgyBorderRadius()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
        child: Center(
          child: addText(text, getNormalTextFontSIze(),
              isActive?ColorConstants.primaryColor:Color(0xFF7B8D9E), FontWeight.bold),
        ),
      ),
    );
  }
}
