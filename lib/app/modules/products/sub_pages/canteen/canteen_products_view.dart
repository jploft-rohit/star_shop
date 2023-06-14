import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/product_canteen_controller.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/delete_dialog.dart';

import '../../../../../common/custom_fab.dart';
import '../../../../../common/custom_stepper.dart';
import '../../../../../common/custom_switch.dart';
import '../../../../../common/utils.dart';

class CanteenProductView extends GetView<ProductCanteenController>{
  const CanteenProductView({super.key,this.type});

  final int? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: CustomFAB(isIcon: true, buttonText: 'Add Item',icon: Icons.add,onButtonClicked: (){
        if(type == 0){
          Get.toNamed(Routes.createCanteenProduct,arguments: {'isPreOrder' : false,'type' : 'Canteen','isEdit' : false});
        } else if(type == 1){
          Get.toNamed(Routes.createStationaryProduct,arguments: {'isPreOrder' : false,'type' : 'Stationary','isEdit' : false});
        } else if(type == 3){
          Get.toNamed(Routes.createStationaryProduct,arguments: {'isPreOrder' : false,'type' : 'Stars Store','isEdit' : false});
        }
      },),
      body: Column(
        children: [
          Center(
            child: Container(

              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                boxShadow: [getBoxShadow()],
                color: ColorConstants.white,
                borderRadius: getBorderRadius()
              ),
              height: 4.5.h,
              child: ListView.builder(
                itemCount: controller.canteenCategoryList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector (
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      controller.selectedCanteenPos.value = index;
                    },
                    child: Container(
                      height: 4.h,
                      width: 30.w,
                      margin: const EdgeInsets.only(top: 2,bottom: 2),
                      decoration: controller.selectedCanteenPos.value == index ? BoxDecoration(
                          borderRadius: getBorderRadius(),
                          boxShadow: [getLightBoxShadow()],
                          // border: Border.all(color: ColorConstants.primaryColor),
                          color: ColorConstants.primaryColorLight) : null,
                      child: Center(child: addText(controller.canteenCategoryList[index], getNormalTextFontSIze(), controller.selectedCanteenPos.value == index ? ColorConstants.primaryColor : ColorConstants.gretTextColor,
                          controller.selectedCanteenPos.value == index ? FontWeight.bold : FontWeight.normal)),
                    ),
                  ));
                },
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          Expanded(child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Obx(() => controller.selectedCanteenPos.value == 2 ? buildMenuItem(index, context) : buildItem(index, context));
            },
          ),)


        ],
      ),
    );
  }

  Widget buildItem(int index,BuildContext context){
    return FadeInUp(
      duration: Duration(milliseconds: 200*(index+1)),
      child: Container(
        width: 100.w,
        padding: const  EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: getCurvedBorderRadius(),
          boxShadow: [getDeepBoxShadow()],
          color: ColorConstants.white
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ClipRRect(
                    borderRadius: getCurvedBorderRadius(),
                    // child: Image.network('https://picsum.photos/id/${Random().nextInt(100)}/200/300',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
                    child: Image.asset(
                      type == 0?'assets/images/im_canteen_0${index+1}.png':
                      type ==1?'assets/images/im_stationary_0${index+1}.png':
                      type ==2?'assets/images/im_uniform_0${index+1}.png':'assets/images/im_stars_store_0${index+1}.png'
                      ,width: 25.w,height: 25.w,fit: BoxFit.cover,)),
                    const SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(
                    height: 25.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildInfoItems('Name', 'Lunch Box'),
                        buildInfoItems('Price', '15 AED'),
                        buildInfoItems('Created Date', '01/08/2023'),
                      ],
                    ),
                  ),
                ),

                if(controller.selectedCanteenPos.value != 1)
                Row(
                  children: [

                    GestureDetector(onTap: (){

                      if(type == 0){
                        Get.toNamed(Routes.createCanteenProduct,arguments: {'isPreOrder' : false,'type' : 'Canteen','isEdit' : true});
                      } else if(type == 1){
                        Get.toNamed(Routes.createStationaryProduct,arguments: {'isPreOrder' : false,'type' : 'Stationary','isEdit' : true});
                      } else if(type == 3){
                        Get.toNamed(Routes.createStationaryProduct,arguments: {'isPreOrder' : false,'type' : 'Stars Store','isEdit' : true});
                      }

                    },
                      child: SvgPicture.asset('assets/images/edit_product.svg',height: getHeadingTextFontSIze(),),),
                    SizedBox(width: 3.w,),
                    GestureDetector(onTap: (){
                      Get.dialog(const DeleteDialog(message: 'Are you sure you want to delete this ?'));
                    },
                      child: SvgPicture.asset('assets/images/ic_delete.svg',height: getHeadingTextFontSIze(),),)

                  ],
                ),

              ],
            ),
            SizedBox(height: 1.h,),
            Obx(() => StepProgressView(width: MediaQuery.of(context).size.width,
                curStep: controller.selectedCanteenPos.value == 0 ? 3 : 4,
                color: ColorConstants.primaryColor,
                statuses: const  ['Request\nRaised','In\nReview','Approved'],
                titles: controller.selectedCanteenPos.value == 1 ? const ['July 2','July 3','July 5'] : const ['July 2','July 3',''])),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(int index,BuildContext context){
    return FadeInUp(
      duration: Duration(milliseconds: 200*(index+1)),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
            borderRadius: getCurvedBorderRadius(),
            boxShadow: [getBoxShadow()],
            color: ColorConstants.white
        ),
        child: Row(
          children: [

            ClipRRect(
                borderRadius: getCurvedBorderRadius(),
              //  child: Image.network('https://picsum.photos/id/${Random().nextInt(100)}/200/300',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
                child:Image.asset(
                  type == 0?'assets/images/im_canteen_0${index+1}.png':
                  type ==1?'assets/images/im_stationary_0${index+1}.png':
                  type ==2?'assets/images/im_uniform_0${index+1}.png':'assets/images/im_stars_store_0${index+1}.png'
                  ,width: 25.w,height: 25.w,fit: BoxFit.cover,)),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText('Product 1', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                  SizedBox(height: 1.h,),
                  buildInfoItems('Current Quantity', '13'),
                  buildInfoItems('Price', '15 AED'),
                  buildInfoItems('Created Date', '01/08/2023'),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Row(
                  children: [

                    GestureDetector(onTap: (){},
                      child: SvgPicture.asset('assets/images/edit_product.svg',height: getHeadingTextFontSIze(),),),
                    SizedBox(width: 3.w,),
                    GestureDetector(onTap: (){
                      Get.dialog(const DeleteDialog(message: 'Are you sure you want to delete this ?'));
                    },
                      child: SvgPicture.asset('assets/images/ic_delete.svg',height: getHeadingTextFontSIze(),),)

                  ],
                ),
                SizedBox(height: 2.h,),
                Row(
                  children: [
                    addText('Off', getSmallTextFontSIze(), ColorConstants.black,
                        FontWeight.normal),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomSwitch(
                      key: GlobalKey(),
                      value: true,
                      enableColor: ColorConstants.primaryColorLight,
                      disableColor: ColorConstants.lightGreyColor,
                      width: 36,
                      height: 18,
                      switchHeight: 15,
                      switchWidth: 15,
                      onChanged: (bool value) {
                        // controller.busDepartureTime.value = !controller.busDepartureTime.value;
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    addText('On', getSmallTextFontSIze(), ColorConstants.black,
                        FontWeight.normal),
                  ],
                ),
                SizedBox(height: 2.h,),



              ],
            )

          ],
        ),
      ),
    );
  }

}