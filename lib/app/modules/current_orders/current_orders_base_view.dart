import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/current_orders_controller.dart';
import 'package:star_shop/app/modules/current_orders/current_order_sub_view.dart';

import '../../../common/app_header.dart';
import '../../../common/base_tab_bar.dart';
import '../../../common/color_constants.dart';

class CurrentOrdersBaseView extends GetView<CurrentOrdersController>{
  const CurrentOrdersBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Current Orders',
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
                CurrentOrderSubView(type: 1),
                CurrentOrderSubView(type: 2),
                CurrentOrderSubView(type: 3),
                CurrentOrderSubView(type: 4),
              ],
            ),
          )
        ],
      ),
    );
  }

}