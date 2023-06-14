import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/out_of_stock_controller.dart';
import 'package:star_shop/common/base_tab_bar.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import 'sub_views/out_of_stock_canteen.dart';

class OutOfStockView extends GetView<OutOfStockItemController>{
  const OutOfStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,

      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Out of Stock Items',
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
                OutOfStockCanteenView(list: controller.canteenList,searchController: controller.canteenSearchController,type: 0,),
                OutOfStockCanteenView(list: controller.stationaryList,searchController: controller.stationarySearchController,type: 1,),
                OutOfStockCanteenView(list: controller.uniformList,searchController: controller.uniformSearchController,type: 2,),
                OutOfStockCanteenView(list: controller.starStoreList,searchController: controller.starStoreSearchController,type: 3,),
              ],
            ),
          )

        ],
      ),
    );
  }

}