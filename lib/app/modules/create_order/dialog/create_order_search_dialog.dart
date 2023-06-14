import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/circular_bordered_button.dart';

import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';
import '../../../controller/create_order/create_order_controller.dart';

class CreateOrderSearchDialog extends GetView<CreateOrderController>{
  const CreateOrderSearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10,),
                  addText('Search Results', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: ColorConstants.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor2)
                ), child: Row(
                children: [
                  const Icon(Icons.search,color: ColorConstants.borderColor,),
                  const SizedBox(width: 10,),
                  Expanded(child: addPrimaryColorEditText(controller.searchController!, ''))
                ],
              ),
              ),
              SizedBox(
                height: 1.h,
              ),

              ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        border: Border.all(color: ColorConstants.borderColor2)
                    ), child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.primaryColor),
                            borderRadius: getCurvedBorderRadius()
                        ), child: SvgPicture.asset('assets/images/user.svg',height: 6.h,),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                        buildInfoItems('Name', 'Yusuf'),
                        buildInfoItems('Designation', 'Teacher Admin'),
                        buildInfoItems('Id', '#87887'),

                        ],
                      ),
                    ],
                  ),

                  );
                },
              ),

              SizedBox(
                height: 2.h,
              ),

              Center(
                child: GestureDetector(
                  onTap: (){},
                  child: CircularBorderedButton(width: 40.w, text: 'CONTINUE'),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

}