import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/orders/orders_controller.dart';
import 'package:star_shop/app/modules/orders/canteen/order_canteen_view.dart';
import 'package:star_shop/app/modules/orders/stars_store/order_star_store_view.dart';
import 'package:star_shop/app/modules/orders/stationary/order_stationary_view.dart';
import 'package:star_shop/app/modules/orders/uniform/order_uniform_view.dart';
import 'package:star_shop/common/base_tab_bar.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';

class OrdersBaseView extends GetView<OrdersController>{
  const OrdersBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Orders',
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
                OrderCanteenView(),
                OrderStationaryView(),
                OrderUniformView(),
                OrderStarStoreView()
              ],
            ),
          )
        ],
      ),
    );
  }

}