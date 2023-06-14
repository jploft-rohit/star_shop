import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/color_constants.dart';

import '../../../common/app_header.dart';
import '../../../common/bordered_button.dart';
import '../../../common/utils.dart';
import '../../controller/search_controller.dart';
import '../../routes/app_routes.dart';
import '../qr_scanner/sos_scanQR.dart';

class SearchView extends GetView<SearchController>{
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: false,
            title: 'Search',
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 5.h,
                child: ListView.builder(
                  itemCount: controller.optionsImageList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        controller.selectedPos.value = index;
                        // if(index == 1){
                        //   Get.to(const ScanQrCodeScreen());
                        // }
                      },
                      child: Obx(
                            () => Container(
                          width: 27.w,
                          margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2),
                          decoration: BoxDecoration(
                              color: controller.selectedPos.value == index
                                  ? ColorConstants.primaryColorLight
                                  : ColorConstants.white,
                              boxShadow: [getBoxShadow()],
                              borderRadius: getBorderRadius()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [getDeepBoxShadow()],
                                    color: controller.selectedPos.value == index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.borderColor2),
                                child: Icon(
                                  Icons.check,
                                  color: ColorConstants.white,
                                  size: getNormalTextFontSIze(),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                child: SvgPicture.asset(
                                  controller.optionsImageList[index],
                                  color: controller.selectedPos.value == index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.black,
                                  height: getLargeTextFontSIze(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Obx(() => Container(
              padding: const EdgeInsets.all(10),
              decoration: getEditTextDecoration(),
              child: Row(
                children: [
                  const Icon(Icons.search,color: ColorConstants.gretTextColor,),
                  const SizedBox(width: 10,),
                  Expanded(child: addSmallEditText2(controller.searchController!, 'Search')),


                  if(controller.selectedPos.value == 0)
                    SvgPicture.asset(controller.optionsImageList[0],height: getLargeTextFontSIze(),color: ColorConstants.primaryColor,),


                  if(controller.selectedPos.value == 1)
                    GestureDetector(
                        onTap: ()=>  Get.to(const ScanQrCodeScreen()),
                        child: SvgPicture.asset(controller.optionsImageList[1],height: getLargeTextFontSIze(),color: ColorConstants.primaryColor,)),


                  if(controller.selectedPos.value == 2)
                    const SizedBox.shrink()


                ],
              ),
            )),
            SizedBox(height: 2.h,),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        border: Border.all(color: ColorConstants.borderColor2)
                    ), child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(1.h),
                        width: 8.h,
                        height: 8.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.primaryColor),
                            borderRadius: getCustomBorderRadius(15)
                        ), child: SvgPicture.asset('assets/images/student.svg',height: 6.h,),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          addText('Sania (Star)', getSubheadingTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                          SizedBox(height: 1.h,),
                          buildInfoItems('ID', '#428746354')

                        ],
                      ),
                    ],
                  ),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}