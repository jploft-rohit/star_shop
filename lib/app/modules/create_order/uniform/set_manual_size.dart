import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/create_order/uniform_menu_controller.dart';

import '../../../../common/app_header.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/utils.dart';

class SetManualSizeView extends GetView<MenuUniformController>{
  const SetManualSizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Set Manual Size',
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: addText('Size for', getNormalTextFontSIze(),
                      ColorConstants.black, FontWeight.bold)),
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
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.borderColor2),
                        borderRadius: getBorderRadius()),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: ColorConstants.primaryColor),
                              borderRadius: getBorderRadius()),
                          child: SvgPicture.asset(
                            'assets/images/user.svg',
                            height: getHeadingTextFontSIze() * 2,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText(
                                  'Raseed Khan (Teacher)',
                                  getNormalTextFontSIze(),
                                  ColorConstants.black,
                                  FontWeight.bold),
                              addText('#4546634', getSmallTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.bold),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Flexible(
                      flex: 1,
                      child: Column(
                        children: [

                          buildEditText('Head', controller.headSizeController!),
                          SizedBox(height: 2.h,),
                          buildEditText('Shoulder', controller.shoulderSizeController!),
                          SizedBox(height: 2.h,),
                          buildEditText('Sleeve', controller.sleeveSizeController!),
                          SizedBox(height: 2.h,),
                          buildEditText('Biceps', controller.bicepsSizeController!),

                        ],
                      )),
                  const SizedBox(width: 15,),
                  Flexible(
                      flex: 1,
                      child: SvgPicture.asset('assets/images/dummy.svg',height: 50.h,)),
                  const SizedBox(width: 15,),
                  Flexible(
                      flex: 1,
                      child: Column(
                        children: [

                          buildEditText('Neck', controller.neckSizeController!),
                          SizedBox(height: 2.h,),
                          buildEditText('Chest', controller.chestSizeController!),
                          SizedBox(height: 2.h,),
                          buildEditText('Wrist', controller.wristSizeController!),
                          SizedBox(height: 2.h,),
                          buildEditText('Short', controller.shortSizeController!),
                          SizedBox(height: 2.h,),
                          buildEditText('Shoe', controller.shoeSizeController!),

                        ],
                      )),

                ],
              ),
              // SizedBox(height: 0.h,),
              buildEditText('Best Matching for T-shirt , Shirt & Jacket Size:', controller.bestMatchingShirtController!),
              SizedBox(height: 2.h,),
              buildEditText('Best Matching for Pant , Short & Skirt Size:', controller.bestMatchingPantSizeController!),
              SizedBox(height: 2.h,),
              buildEditText('Best Matching for Hat Size :', controller.bestMatchingHatSizeController!),
              SizedBox(height: 2.h,),
              buildEditText('Best Matching for Wristband Size :', controller.bestMatchingWristBandSizeController!),
              SizedBox(height: 2.h,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 12),
                  decoration: getPrimaryDecoration2(),
                  child: addText('Save', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                ),
              ),
              SizedBox(height: 4.h,),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditText(String text,TextEditingController controller){
    return  Container(
      decoration: getEditTextDecoration(),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addText(text, getSmallTextFontSIze(), ColorConstants.black, FontWeight.bold),
          const SizedBox(height: 5,),
          addSmallEditText2(controller, '')
        ],
      ),
    );
  }

}