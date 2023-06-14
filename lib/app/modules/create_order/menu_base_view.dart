import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/create_order/create_order_controller.dart';
import 'package:star_shop/app/modules/create_order/canteen/menu_canteen.dart';
import 'package:star_shop/app/modules/create_order/stationary/stationary_menu_view.dart';
import 'package:star_shop/app/modules/create_order/uniform/uniform_menu_view.dart';

import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../routes/app_routes.dart';

class MenuBaseView extends GetView<CreateOrderController> {
  const MenuBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
          backgroundColor: ColorConstants.white,
          title: Obx(() => addText(
              controller.baseHeader.value,
              getSubheadingTextFontSIze(),
              ColorConstants.black,
              FontWeight.bold)),
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: ColorConstants.black),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: getLargeTextFontSIze() * 1.2,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.notificationView);
              },
              child: SvgPicture.asset('assets/images/notification.svg',
                  height: getLargeTextFontSIze() * 1.2),
            ),
            const SizedBox(
              width: 15,
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: addText('Order for', getNormalTextFontSIze(),
                      ColorConstants.black, FontWeight.bold)),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.borderColor2),
                        borderRadius: getBorderRadius()),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorConstants.primaryColor),
                              borderRadius: getBorderRadius()),
                          child: SvgPicture.asset(
                            'assets/images/user.svg',
                            height: getHeadingTextFontSIze() * 2,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText(
                                  'Raseed Khan (Teacher)',
                                  getNormalTextFontSIze(),
                                  ColorConstants.black,
                                  FontWeight.bold),
                              addText('#4546634', getSmallTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.bold),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            buildTabs(),
            SizedBox(height: 2.h,),
            Expanded(
              child: TabBarView(
                controller: controller.controller,
                physics: const NeverScrollableScrollPhysics(),
                children:  [
                  CanteenMenuView(),
                  StationaryMenuView(type:0),
                  UniformMenuView(),
                  StationaryMenuView(type: 1,)
                ],
              ),
            )



          ],
        ),
      ),
    );
  }

  Widget buildTabs() {
    return SizedBox(
      height: 5.5.h,
      child: ListView.builder(
        itemCount: controller.tabListItems.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              controller.selectedTabPosition.value = index;
              controller.controller?.index = index;
              if(controller.controller?.index == 0){
                controller.baseHeader.value = 'Canteen Menu';
              } else if(controller.controller?.index == 1){
                controller.baseHeader.value = 'Stationary Menu';
              } else if(controller.controller?.index == 2){
                controller.baseHeader.value = 'Uniform Menu';
              } else if(controller.controller?.index == 3){
                controller.baseHeader.value = 'Stars Store Menu';
              }
            },
            child: Obx(
              () => Container(
                width: 21.w,
                margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                    color: controller.selectedTabPosition.value == index
                        ? ColorConstants.primaryColorLight
                        : ColorConstants.white,
                    boxShadow: [getBoxShadow()],
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
    );
  }
}
