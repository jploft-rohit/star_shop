import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/color_constants.dart';

import '../../../../common/utils.dart';
import '../../../controller/create_order/canteen_menu_controller.dart';
import '../../../routes/app_routes.dart';

class CanteenMenuView extends GetView<CanteenMenuController>{
  const CanteenMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: buildFAB(),
      body: Column(
        children: [
          buildTabs(),
          SizedBox(height: 2.h,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: getEditTextDecoration(),
            child: Row(
              children: [
                const Icon(Icons.search,color: ColorConstants.borderColor,),
                const SizedBox(width: 10,),
                Expanded(child: addSmallLightEditText(controller.searchController!, 'Search by name'))
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Expanded(
              child: GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 30.h,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 1.h),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: index.isEven
                        ?  EdgeInsets.only(left: 20,bottom: 1.h)
                        :  EdgeInsets.only(right: 20,bottom: 1.h),
                    decoration: BoxDecoration(
                        boxShadow: [getDeepBoxShadow()],
                        color: ColorConstants.white,
                        borderRadius: getCurvedBorderRadius()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: getCurvedBorderRadius(),
                        //   child: Image.network(
                        //     'https://picsum.photos/id/${(index + 20)}/200/300',
                        //     height: 20.h,
                        //     width: double.infinity,
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                            child: Image.asset('assets/images/im_canteen_0${index+1}.png',
                              width: double.infinity,height: 20.h,fit: BoxFit.cover,)),
                        Padding(
                          padding:  EdgeInsets.all(1.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText('NFC Tags', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                              SizedBox(height: 1.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  addText('5 AED', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 3),
                                    decoration: BoxDecoration(
                                        borderRadius: getCurvedBorderRadius(),
                                        border: Border.all(color: ColorConstants.primaryColor),
                                        boxShadow: [getDeepBoxShadow()],
                                        color: ColorConstants.primaryColorLight),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(width: 10,),
                                        GestureDetector(
                                          onTap: (){},
                                          child: addText('-', getNormalTextFontSIze()+8, ColorConstants.primaryColor, FontWeight.bold),
                                        ),
                                        const SizedBox(width: 10,),
                                        addText('2', getSmallTextFontSIze()+6, ColorConstants.primaryColor, FontWeight.bold),
                                        const SizedBox(width: 10,),
                                        GestureDetector(
                                          onTap: (){},
                                          child: addText('+', getNormalTextFontSIze()+8, ColorConstants.primaryColor, FontWeight.bold),
                                        ),
                                        const SizedBox(width: 10,),

                                      ],
                                    ),
                                  ),

                                ],),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget buildTabs() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: 100.w,
        decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: getBorderRadius()
        ),
        height: 5.h,
        child: Center(
          child: ListView.builder(
            itemCount: controller.tabListItems.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  controller.selectedTabPosition.value = index;
                },
                child: Obx(
                      () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                        color: controller.selectedTabPosition.value == index
                            ? ColorConstants.primaryColorLight
                            : Colors.transparent,
                        boxShadow: controller.selectedTabPosition.value == index ? [getBoxShadow()] : null,
                        borderRadius: getBorderRadius()),
                    child: Center(
                        child: addText(
                            controller.tabListItems[index],
                            getNormalTextFontSIze()-1,
                            controller.selectedTabPosition.value == index
                                ? ColorConstants.primaryColor
                                : ColorConstants.gretTextColor,
                            FontWeight.normal)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildFAB(){
    return Material(
        type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
        child: Stack(
          children: [
            Ink(
              decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.primaryColor, width: 2.0),
                color: ColorConstants.primaryColorLight,
                boxShadow: [getDeepBoxShadow()],
                shape: BoxShape.circle,
              ),
              child:  InkWell(
                borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
                onTap: (){
                  Get.toNamed(Routes.canteenCartView);
                },
                child: const Padding(
                  padding:EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30.0,
                    color: ColorConstants.primaryColor,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: ColorConstants.primaryColor,
                  shape: BoxShape.circle,
                ),child: addText('3', getSmallestTextFontSIze(), ColorConstants.white, FontWeight.normal),
              ),
            )
          ],
        )
    );
  }

}