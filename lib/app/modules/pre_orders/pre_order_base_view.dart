import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/pre_order_controller.dart';
import 'package:star_shop/app/modules/pre_orders/pre_order_sub_view.dart';
import '../../../common/app_header.dart';
import '../../../common/base_tab_bar.dart';
import '../../../common/color_constants.dart';
import '../../../common/custom_fab.dart';
import '../../routes/app_routes.dart';

class PreOrdersBaseView extends GetView<PreOrderController>{
  const PreOrdersBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PreOrderController());
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: CustomFAB(isIcon: true,bottomMargin: 0.h, buttonText: 'Add Item',icon: Icons.add,onButtonClicked: (){
        if(controller.tabController?.index == 0){
          Get.toNamed(Routes.createCanteenProduct,arguments: {'isPreOrder' : true,'type' : 'Canteen','isEdit' : false});
        } else if(controller.tabController?.index == 1){
          Get.toNamed(Routes.createStationaryProduct,arguments: {'isPreOrder' : true,'type' : 'Stationary','isEdit' : false});
        }else if(controller.tabController?.index == 2){
          Get.toNamed(Routes.createUniformProduct,arguments: {'isPreOrder' : true,'type' : 'Uniform','isEdit' : false});
        } else if(controller.tabController?.index == 3){
          Get.toNamed(Routes.createStationaryProduct,arguments: {'isPreOrder' : true,'type' : 'Stars Store','isEdit' : false});
        }
      },),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Pre-Orders',
          )),
      body: Column(
        children: [
          SizedBox(height: 2.h,),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: BaseTabBar(
                  tabController: controller.tabController,
                  tabList: [
                    Tab(
                      text: 'Canteen'.tr,
                    ),
                    Tab(
                      text: 'Stationary'.tr,
                    ),
                    Tab(
                      text: 'Uniform'.tr,
                    ),
                    Tab(
                      text: 'Stars Store'.tr,
                    ),
                  ])),
          SizedBox(height: 2.h,),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                PreOrderSubView(type: 1),
                PreOrderSubView(type: 2),
                PreOrderSubView(type: 3),
                PreOrderSubView(type: 4),
              ],
            ),
          )
        ],
      ),
    );
  }

}