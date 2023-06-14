import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/menu_item_list_controller.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/utils.dart';

import '../../../../common/custom_switch.dart';

class MenuItemCanteenView extends GetView<MenuItemListController>{
   const MenuItemCanteenView({super.key, this.list,this.searchController,this.type});

  final List<String>? list;
  final TextEditingController? searchController;
  final int? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: buildFAB(),
      body: Column(
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
          Expanded(child: ListView.builder(
            itemCount: list?.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return buildListItem(index,context,list!);
            },
          ))
          
        ],
      ),
    );
  }

  Widget buildListItem(int index,BuildContext context,List<String> list){
    return FadeInUp(
      duration: Duration(milliseconds: 200*(index+1)),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: getCurvedBorderRadius(),
          boxShadow: [getBoxShadow()],
          color: ColorConstants.white
        ),
        child: Row(
          children: [

            ClipRRect(
                borderRadius: getCurvedBorderRadius(),
              //  child: Image.network('https://picsum.photos/id/${Random().nextInt(100)}/200/300',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
                child: Image.asset('assets/images/im_canteen_0${index+1}.png',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText(list[index], getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                  SizedBox(height: 1.h,),
                  buildInfoItems('Current Quantity', '13'),
                  buildInfoItems('Price', '15 AED'),
                  buildInfoItems('Created Date', '01/08/2023'),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Row(
                  children: [

                    GestureDetector(onTap: (){},
                    child: SvgPicture.asset('assets/images/edit_product.svg',height: getHeadingTextFontSIze(),),),
                    SizedBox(width: 3.w,),
                    GestureDetector(onTap: (){},
                      child: SvgPicture.asset('assets/images/ic_delete.svg',height: getHeadingTextFontSIze(),),)

                  ],
                ),
                SizedBox(height: 3.h,),
                Row(
                  children: [
                    addText('Off', getSmallTextFontSIze(), ColorConstants.black,
                        FontWeight.normal),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomSwitch(
                      key: GlobalKey(),
                      value: true,
                      enableColor: ColorConstants.primaryColorLight,
                      disableColor: ColorConstants.lightGreyColor,
                      width: 36,
                      height: 18,
                      switchHeight: 15,
                      switchWidth: 15,
                      onChanged: (bool value) {
                        // controller.busDepartureTime.value = !controller.busDepartureTime.value;
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    addText('On', getSmallTextFontSIze(), ColorConstants.black,
                        FontWeight.normal),
                  ],
                )



              ],
            )

          ],
        ),
      ),
    );
  }

   Widget buildFAB(){
     return Material(
         type: MaterialType.transparency,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Ink(
               decoration: BoxDecoration(
                 border: Border.all(color: ColorConstants.primaryColor, width: 1.0),
                 color: ColorConstants.primaryColorLight,
                 boxShadow: [getDeepBoxShadow()],
                 shape: BoxShape.circle,
               ),
               child:  InkWell(
                 borderRadius: BorderRadius.circular(1000.0),
                 onTap: (){
                 },
                 child:  const Padding(
                   padding:EdgeInsets.all(5.0),
                   child: Icon(
                     Icons.add,
                     size: 50.0,
                     color: ColorConstants.primaryColor,
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 5,),
             addAlignedText('Add Item', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
           ],
         )
     );
   }

}