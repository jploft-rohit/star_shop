import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/transportation/bus_location_controller.dart';
import 'package:star_shop/common/bordered_button.dart';
import 'package:star_shop/common/direction_view.dart';
import 'package:star_shop/common/success_dialog.dart';
import 'package:star_shop/common/utils.dart';

import '../../../../common/app_header.dart';
import '../../../../common/color_constants.dart';

class ChangeLocationView extends GetView<BusLocationController> {
  const ChangeLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(5.h),
          child: AppHeader(showBackIcon: true, title: 'Change Location',)),
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/images/pin.svg'),
              const SizedBox(width: 10,),
              addText('Find on Map', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold)
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            children: [
              Expanded(child: addSmallEditText(controller.locationController!, 'Type Your Location')),
              const SizedBox(width: 10,),
              GestureDetector(
                 onTap: () =>  Get.to(const DirectionView()),
                  child: SvgPicture.asset('assets/images/ic_map.svg'))
            ],
          ),
          const Divider(),

          Row(
            children: [


              Flexible(child: buildEditTexts(controller.sectorController!, 'Sector')),
              const SizedBox(width: 10,),
              Flexible(child: buildEditTexts(controller.areaController!, 'Area')),


            ],
          ),
          SizedBox(height: 2.h,),
          Row(
            children: [


              Flexible(child: buildEditTexts(controller.streetController!, 'Street')),
              const SizedBox(width: 10,),
              Flexible(child: buildEditTexts(controller.buildingController!, 'Building/Villa')),


            ],
          ),
          SizedBox(height: 2.h,),
          Row(
            children: [


              Flexible(child: buildEditTexts(controller.flatController!, 'Flat/Villa No.')),
              const SizedBox(width: 10,),
              Flexible(child: buildEditTexts(controller.landmarkController!, 'Landmark')),


            ],
          ),
          SizedBox(height: 2.h,),
          Row(
            children: [


              Flexible(child: buildEditTexts(controller.mobileController!, 'Mobile No.')),
              const SizedBox(width: 10,),
              Flexible(child: buildEditTexts(controller.landlineController!, 'Landline No.')),


            ],
          ),
          SizedBox(height: 2.h,),
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addText('Flat/Villa Photo', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
          SizedBox(height: 1.h,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(
                borderRadius: getEdgyBorderRadius(),
                border: Border.all(color: ColorConstants.borderColor),
                color: ColorConstants.etBgColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText('Upload Photo', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                SvgPicture.asset('assets/images/ic_upload.svg')
              ],
            ),
          )
        ],
      ),
          const SizedBox(height: 2,),
          Align(alignment: Alignment.topLeft,
          child: addText('Photo Uploaded 132KB', getSmallestTextFontSIze(), ColorConstants.blue, FontWeight.normal),),
          SizedBox(height: 4.h,),
          GestureDetector(
            onTap: (){
              Get.dialog(const SuccessDialog(message: 'Request Sent Successfully'));
            },
            child: BorderedButton(width: 2, text: 'SEND REQUEST'),
          )
          



        ],
      ),),);
  }


  Widget buildEditTexts(TextEditingController controller, String heading){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addText(heading, getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
        SizedBox(height: 1.h,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
          decoration: BoxDecoration(
              borderRadius: getEdgyBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.etBgColor),
          child: TextFormField(
            cursorColor: ColorConstants.primaryColor,
            keyboardType: TextInputType.multiline,
            controller: controller,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: getNormalTextFontSIze()),
            decoration: InputDecoration(
              isDense: true,
                hintText: '',
                hintStyle: TextStyle(
                    fontSize: getNormalTextFontSIze(),
                    color: ColorConstants.black),
                border: InputBorder.none),
          ),
        )
      ],
    );
  }

}