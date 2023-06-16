import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/assignments/utils/sizes.dart';
import 'package:star_shop/common/color_constants.dart';


class BaseDetailData extends StatelessWidget {
  final String? prefixIcon;
  final String? suffixIcon;
  final String detailsLabel;
  final String detailsValue;
  final double? topMargin,bottomMargin,rightMargin,leftMargin;
  final bool? showDivider;
  final bool? spacedSuffix;

  const BaseDetailData({Key? key,this.prefixIcon, required this.detailsLabel,this.detailsValue="", this.topMargin, this.bottomMargin, this.showDivider, this.rightMargin, this.leftMargin, this.suffixIcon, this.spacedSuffix}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
      child: Column(
        mainAxisSize: (spacedSuffix??false) ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: (spacedSuffix??false) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: (prefixIcon??"").isNotEmpty,
                child: Padding(
                  padding:  EdgeInsets.only(right: 1.w),
                  child: SvgPicture.asset(prefixIcon??"",height: 2.h,width: 2.h,),
                ),
              ),
              Flexible(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: detailsValue != "" ? "${detailsLabel} : ":"${detailsLabel}",
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: detailLabelTs,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          )),
                      if(detailsValue.isNotEmpty)
                        TextSpan(
                          text: "$detailsValue",
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: detailValueTs,
                            color: ColorConstants.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: (suffixIcon??"").isNotEmpty,
                child: GestureDetector(
                  onTap: () async {
                    if (suffixIcon == "ic_copy") {
                      await Clipboard.setData(ClipboardData(text: detailsValue));
                      Fluttertoast.showToast(msg: "Copied");
                    }
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(left: 1.w),
                    child: SvgPicture.asset(suffixIcon??"",height: 2.h,width: 2.h,),
                  ),
                ),
              )
            ],
          ),
          Visibility(visible: showDivider??true, child: const Divider(color: ColorConstants.dividerColor,)),
        ],
      ),
    );
  }
}
