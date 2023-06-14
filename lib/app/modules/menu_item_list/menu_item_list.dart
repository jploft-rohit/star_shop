import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/menu_item_list_controller.dart';
import 'package:star_shop/app/modules/menu_item_list/sub_views/menu_item_canteen_view.dart';
import 'package:star_shop/common/base_tab_bar.dart';
import 'package:star_shop/common/color_constants.dart';

import '../../../common/app_header.dart';
import '../../../common/utils.dart';

class MenuItemList extends GetView<MenuItemListController>{
  const MenuItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,

      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Menu Item List',
          )),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: BaseTabBar(
                  tabController: controller.controller,
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
              controller: controller.controller,
              children:  [
                MenuItemCanteenView(list: controller.canteenList,searchController: controller.canteenSearchController,type: 0,),
                MenuItemCanteenView(list: controller.stationaryList,searchController: controller.stationarySearchController,type: 1,),
                MenuItemCanteenView(list: controller.uniformList,searchController: controller.uniformSearchController,type: 2,),
                MenuItemCanteenView(list: controller.starStoreList,searchController: controller.starStoreSearchController,type: 3,),
              ],
            ),
          )

        ],
      ),
    );
  }



}