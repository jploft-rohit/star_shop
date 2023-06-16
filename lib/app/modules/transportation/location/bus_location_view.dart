import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/transportation/bus_location_controller.dart';
import 'package:star_shop/app/routes/app_routes.dart';

import '../../../../common/app_header.dart';
import '../../../../common/circular_bordered_button.dart';
import '../../../../common/color_constants.dart';
import '../../../../common/custom_stepper.dart';
import '../../../../common/print_qr_dialog.dart';
import '../../../../common/utils.dart';

class BusLocationView extends GetView<BusLocationController>{
  const BusLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(5.h), child:  const AppHeader(showBackIcon: true, title: 'Location',)),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor2,width: 1.5),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        border: Border.all(color: ColorConstants.primaryColor),
                      ),
                      child: SvgPicture.asset('assets/images/user.svg',height: getLargeTextFontSIze()*2,),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          addText('Rafiq Khan', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                          const SizedBox(height: 5,),
                          addText('#296825', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                          const SizedBox(height: 5,),
                          addText('Security', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),

                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        showQrDialog();
                      }, child: SvgPicture.asset('assets/images/qrcode.svg'),
                    )
                  ],
                ),
              ),

              SizedBox(height: 3.h,),



              Row(
                children: [
                  SvgPicture.asset('assets/images/pin.svg',height: getHeadingTextFontSIze(),),
                  const SizedBox(width: 5,),
                  addText('Location', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                  addText(' : Lia Tower; P.O. Box 901; Abu Dhabi', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold)
                ],
              ),
              SizedBox(height: 2.h,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 1),
                decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    boxShadow: [getBoxShadow()],
                    color: ColorConstants.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 100.w,
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      decoration: BoxDecoration(
                          borderRadius: getCurvedBorderRadius(),
                          border: Border.all(color: ColorConstants.primaryColor)
                      ), child: SvgPicture.asset('assets/images/house.svg'),
                    ),
                    SizedBox(height: 2.h,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [

                          Column(
                            children: [
                             Row(
                               children: [
                                 buildInfoItems('Sector', 'Dubai'),
                                 const Spacer(),
                                 GestureDetector(
                                   onTap: (){
                                     showConfirmationDialog(1, context);
                                   },
                                   child: SvgPicture.asset('assets/images/ic_edit.svg',height: getHeadingTextFontSIze(),),
                                 ),


                                 const SizedBox(width: 10,),
                                 GestureDetector(
                                   onTap: (){
                                     showConfirmationDialog(0, context);
                                   },
                                   child: SvgPicture.asset('assets/images/ic_delete.svg',height: getHeadingTextFontSIze(),),
                                 ),


                               ],
                             ),
                              buildInfoItems('Area', 'Jumeriah'),
                              buildInfoItems('Street', '53 B'),
                              buildInfoItems('Building/Villa', 'KM Tower'),
                              buildInfoItems('Flat/Villa No', '123456'),
                              buildInfoItems('Landmark', 'Jumeriah'),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildInfoItems('Mobile No', '0503664321  '),
                                  GestureDetector(
                                    onTap: () async {
                                      await Clipboard.setData(
                                          const ClipboardData(text: "0503664321"));
                                      showToast('Number copied to clipboard');
                                    },
                                    child: Icon(
                                      Icons.copy,
                                      color: ColorConstants.primaryColor,
                                      size: getHeadingTextFontSIze(),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildInfoItems('Landline No', 'L043674882  '),
                                  GestureDetector(
                                    onTap: () async {
                                      await Clipboard.setData(
                                          const ClipboardData(text: "0503664321"));
                                      showToast('Number copied to clipboard');
                                    },
                                    child: Icon(
                                      Icons.copy,
                                      color: ColorConstants.primaryColor,
                                      size: getHeadingTextFontSIze(),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 2.h,)
                            ],
                          ),



                        ],
                      ),
                    ),
                    Divider(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: StepProgressView(width: MediaQuery.of(context).size.width,
                          curStep: 3,
                          statuses: const ['Request\nRaised','Reviewed','Approved'],
                          color: ColorConstants.primaryColor,
                          titles: const ['July 2 8:30 pm','July 2 8:30 pm','July 2 8:30 pm']),
                    ),

                    SizedBox(height: 2.h,),

                  ],
                ),
              ),
              SizedBox(height: 4.h,),
            ],
          ),
        ),
      ),
    );
  }


  void showConfirmationDialog(int type,BuildContext context) {
    showGeneralDialog(barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                content: SizedBox(
                  width: 100.w,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Align(alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: const Icon(Icons.close,color: ColorConstants.borderColor,),
                        ),),

                        SizedBox(height: 1.h,),
                        if(type == 1)
                        addAlignedText('Are you sure you want to change the location?',
                            getSubheadingTextFontSIze(),
                            ColorConstants.black, FontWeight.bold),

                        if(type == 0)
                          addAlignedText('Are you sure you want to delete the location?',
                              getSubheadingTextFontSIze(),
                              ColorConstants.black, FontWeight.bold),


                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            if(type == 0){
                              Get.back();
                            } else {
                              Get.back();
                              Get.toNamed(Routes.changeBusLocation);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorConstants.primaryColorLight,
                                    boxShadow: [getDeepBoxShadow()],
                                    border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
                                    borderRadius: getBorderRadiusCircular()),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                                  child: Center(
                                    child: addText('Yes', getSubheadingTextFontSIze(),
                                        ColorConstants.primaryColor, FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }







}