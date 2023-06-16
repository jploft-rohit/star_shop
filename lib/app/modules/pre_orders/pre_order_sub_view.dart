import 'dart:math';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/current_orders_controller.dart';

import '../../../common/color_constants.dart';
import '../../../common/utils.dart';

class PreOrderSubView extends GetView<CurrentOrdersController>{
  const PreOrderSubView({super.key,required this.type});

  final int type;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: 100.w,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 8),
                    padding: const EdgeInsets.only(
                        left: 20, top: 20, bottom: 10, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        boxShadow: [getDeepBoxShadow()],
                        color: ColorConstants.white),
                    child: Row(
                      children: [


                        ClipRRect(
                            borderRadius: getCurvedBorderRadius(),
                            child: Image.asset(
                              type == 1?'assets/images/im_canteen_0${index+1}.png':
                              type ==2?'assets/images/im_stationary_0${index+1}.png':
                              type ==3?'assets/images/im_uniform_0${index+1}.png':'assets/images/im_stars_store_0${index+1}.png'
                              ,width: 25.w,height: 25.w,fit: BoxFit.cover,)),
                        const SizedBox(width: 10,),






                        Expanded(
                            child: Column(
                              children: [
                                buildInfoItems('Product Name', 'Product ${index+1}'),
                                buildInfoItems('Quantity', '20'),
                                buildInfoItems('Requested Date', '24-03-2023'),
                                buildInfoItems('Required Date', '30-03-2023'),

                              ],
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}