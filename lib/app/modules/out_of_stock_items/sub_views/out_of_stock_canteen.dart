import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/menu_item_list_controller.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/utils.dart';

import '../../../../common/custom_fab.dart';
import '../../../../common/custom_switch.dart';
import '../../../controller/out_of_stock_controller.dart';

class OutOfStockCanteenView extends GetView<OutOfStockItemController>{
  const OutOfStockCanteenView({super.key, this.list,this.searchController,this.type});

  final List<String>? list;
  final TextEditingController? searchController;
  final int? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      // floatingActionButton: CustomFAB(isIcon: true, buttonText: 'Add Item',icon: Icons.add,onButtonClicked: (){
      //   if(controller.controller.index == 0){
      //     Get.toNamed(Routes.createCanteenProduct,arguments: {'isPreOrder' : false,'type' : 'Canteen','isEdit' : false});
      //   } else if(controller.controller.index == 1){
      //     Get.toNamed(Routes.createStationaryProduct,arguments: {'isPreOrder' : false,'type' : 'Stationary','isEdit' : false});
      //   } else if(controller.controller.index == 2){
      //     Get.toNamed(Routes.createUniformProduct,arguments: {'isPreOrder' : false,'type' : 'Uniform','isEdit' : false});
      //   } else {
      //     Get.toNamed(Routes.createStationaryProduct,arguments: {'isPreOrder' : false,'type' : 'Stars Store','isEdit' : false});
      //   }
      // },),
      body: Builder(
        builder: (context) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.borderColor2),
                    borderRadius: getBorderRadius()
                ), child: Row(
                children: [

                  const Icon(Icons.search,color: ColorConstants.gretTextColor,),
                  const SizedBox(width: 10,),
                  Expanded(child: addSmallEditText(searchController!, 'Search Products')),
                ],
              ),
              ),
              SizedBox(height: 2.h,),
              SizedBox(
                height: 5.h,
                child: ListView.builder(
                  itemCount: controller.categoryList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Obx(() => GestureDetector(
                      onTap: () {
                        controller.selectedCategoryPos.value = index;
                      },
                      child: Container(
                        width: 42.w,
                        margin: const EdgeInsets.only(right: 10,top: 2,bottom: 2,left: 10),
                        decoration: controller.selectedCategoryPos.value == index
                            ? getPrimaryDecoration2()
                            : getEditTextDecoration(),
                        child: Center(
                            child: addText(
                                controller.categoryList[index],
                                getNormalTextFontSIze(),
                                controller.selectedCategoryPos.value == index
                                    ? ColorConstants.primaryColor
                                    : ColorConstants.borderColor,
                                FontWeight.normal)),
                      ),
                    ));
                  },
                ),
              ),
              SizedBox(height: 2.h,),
              Expanded(child: ListView.builder(
                itemCount: list?.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      return controller.selectedCategoryPos.value == 0 ? buildListItem(index,context,list!,type!):buildAboutListItem(index,context,list!,type!);
                    }
                  );
                },
              ))

            ],
          );
        }
      ),
    );
  }

  Widget buildListItem(int index,BuildContext context,List<String> list, int type){
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: getCurvedBorderRadius(),
          boxShadow: [getBoxShadow()],
          color: ColorConstants.white
      ),
      child: Row(
        children: [

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.primaryColor),
              borderRadius: getCurvedBorderRadius()
            ),
            child: ClipRRect(
                borderRadius: getCurvedBorderRadius(),
               // child: Image.network('https://picsum.photos/id/${Random().nextInt(100)}/200/300',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
                child: Image.asset(
                  type == 0?'assets/images/im_canteen_0${index+1}.png':
                      type ==1?'assets/images/im_stationary_0${index+1}.png':
                          type ==2?'assets/images/im_uniform_0${index+1}.png':'assets/images/im_stars_store_0${index+1}.png'
                  ,width: 25.w,height: 25.w,fit: BoxFit.cover,)),
            ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText(list[index], getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                SizedBox(height: 1.h,),
                buildInfoItems('Request', '13'),
                buildInfoItems('Price', '15 AED'),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget buildAboutListItem(int index,BuildContext context,List<String> list ,int type){
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: getCurvedBorderRadius(),
          boxShadow: [getBoxShadow()],
          color: ColorConstants.white
      ),
      child: Row(
        children: [

          Container(
            decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.primaryColor),
                borderRadius: getCurvedBorderRadius()
            ),
            child: ClipRRect(
                borderRadius: getCurvedBorderRadius(),
               // child: Image.network('https://picsum.photos/id/${Random().nextInt(100)}/200/300',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
                child: Image.asset(
                  type == 0?'assets/images/im_canteen_0${index+1}.png':
                  type ==1?'assets/images/im_stationary_0${index+1}.png':
                  type ==2?'assets/images/im_uniform_0${index+1}.png':'assets/images/im_stars_store_0${index+1}.png'
                  ,width: 25.w,height: 25.w,fit: BoxFit.cover,)),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText(list[index], getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                SizedBox(height: 1.h,),
                buildInfoItems('Requested Qty', '13'),
                buildInfoItems('Available Qty', '16'),
                buildInfoItems('Price', '15 AED'),
              ],
            ),
          ),

        ],
      ),
    );
  }

}