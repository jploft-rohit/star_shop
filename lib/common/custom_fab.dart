import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:star_shop/common/utils.dart';

import 'color_constants.dart';

class CustomFAB extends StatelessWidget {

  final Function()? onButtonClicked;
  final IconData? icon;
  final bool isIcon;
  final String buttonText;
  final String? svgPath;
  final double? bottomMargin;

  const CustomFAB({Key? key,this.onButtonClicked,this.icon,required this.isIcon,required this.buttonText,this.svgPath,this.bottomMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Ink(
              decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.primaryColor, width: 1.0),
                color: ColorConstants.primaryColorLight,
                boxShadow: [getDeepBoxShadow()],
                shape: BoxShape.circle,
              ),
              child:  InkWell(
                borderRadius: BorderRadius.circular(1000.0),
                onTap: onButtonClicked,
                child: Padding(
                  padding:const EdgeInsets.all(5.0),
                  child: isIcon ? Icon(
                    icon,
                    size: 50.0,
                    color: ColorConstants.primaryColor,
                  ) : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(svgPath!,height: 30,),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            addAlignedText(buttonText, getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
            SizedBox(height: bottomMargin ?? 0)

          ],
        )
    );
  }
}
