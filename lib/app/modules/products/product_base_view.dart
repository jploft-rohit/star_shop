import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/products/sub_pages/canteen/canteen_products_view.dart';
import 'package:star_shop/app/modules/products/sub_pages/uniform/uniform_products_view.dart';
import 'package:star_shop/common/base_tab_bar.dart';
import 'package:star_shop/common/color_constants.dart';

import '../../../common/app_header.dart';
import '../../../common/utils.dart';
import '../../controller/product_controller.dart';


class ProductBaseView extends GetView<ProductController>{
  const ProductBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Products',
          )),
      body: Column(
        children: [
          SizedBox(height: 2.h,),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
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
              children: const [
                CanteenProductView(type: 0,),
                /*StationaryProductView(),*/CanteenProductView(type: 1,),
                UniformProductView(),
                /*StarStoreProductView()*/CanteenProductView(type: 3,),
              ],
            ),
          )
        ],
      ),
    );
  }

}