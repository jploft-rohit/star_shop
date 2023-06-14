import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/rating/points_added_success_dialog.dart';
import 'package:star_shop/app/modules/rating/positive.dart';
import 'package:star_shop/common/success_dialog.dart';
import '../../../common/circular_bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/rating_controller.dart';
import 'needs.dart';

class StarRatingDialog extends GetView<RatingController>{
   StarRatingDialog({super.key});

  @override
  final controller = Get.put(RatingController());

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
                  const SizedBox(width: 10,),
                  addText('Star Rating', getSubheadingTextFontSIze(),
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
              buildTabs(),
              SizedBox(height: 2.h,),

              SizedBox(
                height: 40.h,
                child: TabBarView(

                  controller: controller.controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    PositiveStar(),
                    NeedsStar(),
                  ],
                ),
              ),


            

              SizedBox(
                height: 2.h,
              ),

              // GestureDetector(
              //   onTap: () {
              //     Get.back();
              //    Get.dialog(const PointsAddedSuccessDialog());
              //   },
              //   child: CircularBorderedButton(width: 40.w, text: 'SUBMIT'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabs(){
    return  SizedBox(
      height: 5.h,
      child: ListView.builder(
        itemCount: controller.tabListItems.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              controller.selectedTabPosition.value = index;
              controller.controller.index = index;
            },
            child: Obx(
                  () => Container(
                width: 35.w,
                margin:  EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.5.h),
                // padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                    color: controller.selectedTabPosition.value == index ? ColorConstants.primaryColorLight : ColorConstants.white,
                    boxShadow: [getBoxShadow()],
                    borderRadius: getBorderRadius()),
                child: Center(child: addText(controller.tabListItems[index], getNormalTextFontSIze(), controller.selectedTabPosition.value == index ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.bold)),
              ),
            ),
          );
        },
      ),
    );
  }

}

class TabsView extends StatelessWidget {
  const TabsView(
      {Key? key,
        required this.tabIndex,
        required this.firstTab,
        required this.secondTab})
      : super(key: key);

  final int tabIndex;
  final Widget firstTab;
  final Widget secondTab;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          child: firstTab,
          width: 100.w,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          transform: Matrix4.translationValues(
              tabIndex == 0 ? 0 : -100.w, 0, 0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
        AnimatedContainer(
          child: secondTab,
          width: 100.w,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          transform: Matrix4.translationValues(
              tabIndex == 1 ? 0 : 100.w, 0, 0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        )
      ],
    );
  }
}