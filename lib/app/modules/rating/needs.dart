import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/starpointdeductdialog/starpointdeductDialog.dart';

import '../../../common/color_constants.dart';
import '../../../common/custom_star.dart';
import '../../../common/utils.dart';
import '../../controller/rating_controller.dart';

class NeedsStar extends GetView<RatingController>{
  const NeedsStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: GridView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            Get.dialog(StarPointDeductPop());
          },
          child: Container(
            decoration: BoxDecoration(
                color: ColorConstants.borderColor2.withOpacity(0.5),
                borderRadius: getCurvedBorderRadius()
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 5,
                  top: 5,
                  child: SizedBox(
                    width: 5.6.w,
                    height: 5.6.w,
                    child: CustomPaint(
                      size: const Size(22,22),
                      painter:  RPSCustomPainter(bgColor: ColorConstants.primaryColor.withOpacity(0.4)),
                      child: Center(child: addText('-2', getSmallestTextFontSIze()-1.5, ColorConstants.white, FontWeight.normal),),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SvgPicture.asset(controller.starRatingImageList[index]),
                      const SizedBox(height: 5,),
                      addText(controller.starHabitNames[index], getSmallTextFontSIze()-1, ColorConstants.black, FontWeight.bold)

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        itemCount:controller.starRatingImageList.length,
      ),
    );
  }

}