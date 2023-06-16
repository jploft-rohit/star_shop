
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/current_orders_controller.dart';

import '../../../common/color_constants.dart';
import '../../../common/utils.dart';

class CurrentOrderSubView extends GetView<CurrentOrdersController>{
  const CurrentOrderSubView({super.key,required this.type});

  final int type;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: 8,
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
                        Expanded(
                            child: Column(
                              children: [
                                buildInfoItems('Customer Name', 'Roma'),
                                buildInfoItems('Customer ID', '#26784258'),
                                buildInfoItems('Order ID', '#46874'),
                                buildInfoItems('Quantity', '5'),
                                buildInfoItems('Total Price', '257 AED'),
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