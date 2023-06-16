
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/product_uniform_controller.dart';
import '../../../../../common/color_constants.dart';
import '../../../../../common/custom_fab.dart';
import '../../../../../common/custom_stepper.dart';
import '../../../../../common/custom_switch.dart';
import '../../../../../common/delete_dialog.dart';
import '../../../../../common/utils.dart';
import '../../../../routes/app_routes.dart';

class UniformProductView extends GetView<ProductUniformController>{
  const UniformProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: CustomFAB(isIcon: true, buttonText: 'Add Item',icon: Icons.add,onButtonClicked: (){
        Get.toNamed(Routes.createUniformProduct,arguments: {'isPreOrder' : false,'type' : 'Uniform','isEdit' : false});
      },),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                  boxShadow: [getBoxShadow()],
                  color: ColorConstants.white,
                  borderRadius: getBorderRadius()
              ),
              height: 4.5.h,
              child: ListView.builder(
                itemCount: controller.uniformCategoryList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector (
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      controller.selectedUniformPos.value = index;
                    },
                    child: Container(
                      height: 4.h,
                      width: 30.w,
                      margin: const EdgeInsets.only(top: 2,bottom: 2),
                      decoration: controller.selectedUniformPos.value == index ? BoxDecoration(
                          borderRadius: getBorderRadius(),
                          boxShadow: [getLightBoxShadow()],
                          // border: Border.all(color: ColorConstants.primaryColor),
                          color: ColorConstants.primaryColorLight) : null,
                      child: Center(child: addText(controller.uniformCategoryList[index], getNormalTextFontSIze(),
                          controller.selectedUniformPos.value == index ? ColorConstants.primaryColor : ColorConstants.gretTextColor,
                          controller.selectedUniformPos.value == index ? FontWeight.bold : FontWeight.normal)),
                    ),
                  ));
                },
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          Expanded(child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Obx(() => controller.selectedUniformPos.value == 2 ? buildMenuItem(index, context) : buildItem(index, context));
            },
          ),)


        ],
      ),
    );
  }

  Widget buildItem(int index,BuildContext context){
    return Container(
      width: 100.w,
      padding: const  EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: getCurvedBorderRadius(),
          boxShadow: [getDeepBoxShadow()],
          color: ColorConstants.white
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ClipRRect(
                  borderRadius: getCurvedBorderRadius(),
                //  child: Image.network('https://picsum.photos/id/${Random().nextInt(100)}/200/300',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
                  child: Image.asset('assets/images/im_uniform_0${index+1}.png',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildInfoItems('Name', 'Lunch Box'),
                    buildInfoItems('Price', '15 AED'),
                    buildInfoItems('Created Date', '01/08/2023'),
                    Row(
                      children: [
                        Expanded(child: buildInfoItems('Size', 'XL')),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(onTap: (){}, child: const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,size: 18,)),
                            SizedBox(width: 2.5.w),
                            GestureDetector(onTap: (){},
                                child: SvgPicture.asset('assets/images/ic_download.svg',height: 14))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              Column(
                children: [

                  if(controller.selectedUniformPos.value != 1)
                  Row(
                    children: [

                      GestureDetector(onTap: (){
                        Get.toNamed(Routes.createUniformProduct,arguments: {'isPreOrder' : false,'type' : 'Uniform','isEdit' : true});
                      },
                        child: SvgPicture.asset('assets/images/edit_product.svg',height: getHeadingTextFontSIze(),),),
                      SizedBox(width: 3.w,),
                      GestureDetector(onTap: (){
                        Get.dialog(const DeleteDialog(message: 'Are you sure you want to delete this ?'));
                      },
                        child: SvgPicture.asset('assets/images/ic_delete.svg',height: getHeadingTextFontSIze(),),)

                    ],
                  ),
                  SizedBox(height: 5.h,),

                ],
              ),
            ],
          ),
          SizedBox(height: 1.h,),
          Obx(() => StepProgressView(width: MediaQuery.of(context).size.width,
              curStep: controller.selectedUniformPos.value == 0 ? 3 : 4,
              color: ColorConstants.primaryColor,
              statuses: const  ['Request\nRaised','In\nReview','Approved'],
              titles: controller.selectedUniformPos.value == 1 ? const ['July 2','July 3','July 5'] : const ['July 2','July 3',''])),
        ],
      ),
    );
  }

  Widget buildMenuItem(int index,BuildContext context){
    return Container(
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
              child: Image.asset('assets/images/im_uniform_0${index+1}.png',width: 25.w,height: 25.w,fit: BoxFit.cover,)),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText('Product 1', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
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
    );
  }

}