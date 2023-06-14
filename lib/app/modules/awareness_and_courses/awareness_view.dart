import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/awareness_controller.dart';
import 'package:star_shop/app/controller/home_controller.dart';
import 'package:star_shop/common/detail_row_widget.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/custom_stepper.dart';
import '../../../common/utils.dart';

class AwarenessView extends GetView<AwarenessController>{
  const AwarenessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Awareness & Courses ',
          )),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: getBorderRadius(),
                border: Border.all(color: ColorConstants.borderColor),
                color: ColorConstants.primaryColorLight),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: buildSchoolDropDown(Get.find<HomeController>().schoolItems, Get.find<HomeController>().selectedSchool, 'Hint', 100.w),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      padding: const EdgeInsets.all(0.0),
                      decoration: BoxDecoration(
                        boxShadow: [getBoxShadow()],
                        borderRadius: getBorderRadius(),
                        color: ColorConstants.white,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              // ClipRRect(
                              //   borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              //   child: Image.network('https://picsum.photos/id/${(index*2)}/300/300',width: 100.w,height: 25.h,fit: BoxFit.cover,),
                              // ),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                child: Image.asset('assets/images/im_canteen_0${index+1}.png',width: 100.w,height: 25.h,fit: BoxFit.cover,),
                              ),
                              Positioned(
                                top: 10.h,bottom: 10.h,left:0,right: 0,
                                child: SvgPicture.asset('assets/images/ic_play.svg',),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                SizedBox(height: 2.h,),
                                buildInfoItems('Description', 'New Uniform need to be purchase'),
                                // DetailsRow(detailsLabel: 'Description', detailsValue: 'New Uniform need to be purchase'),
                                buildDivider(),
                                Row(
                                  children: [


                                    buildInfoItems('File', 'attendance.xml'),
                                    // DetailsRow(detailsLabel: 'File', detailsValue: 'attendance.xml'),
                                    const SizedBox(width: 5,),
                                    const Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,),

                                    const Spacer(),
                                    verticalDivider(),
                                    const Spacer(),

                                    buildInfoItems('Due Date', '30/06/2022'),

                                    // DetailsRow(detailsLabel: 'Due Date', detailsValue: '30/06/2022')


                                  ],
                                ),
                                buildDivider(),
                                const SizedBox(
                                  height: 10,
                                ),
                                StepProgressView(
                                      width: MediaQuery.of(context).size.width,
                                      curStep: 5,
                                      statuses: const ['Received','Viewed','       Quiz','Completed'],
                                      color: ColorConstants.primaryColor,
                                      titles: const ['July 2', 'July 3', 'July 4','July 5']),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,)
                        ],
                      ),
                    ),
                    if (index == 2)
                      SizedBox(
                        height: 15.h,
                      )
                  ],
                ),
              );
            },
          ))



        ],
      ),
    );
  }

}