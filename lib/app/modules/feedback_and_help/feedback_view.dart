import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/base_tab_bar.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/custom_fab.dart';
import '../../../common/utils.dart';
import '../../controller/feedback_controller.dart';
import '../../routes/app_routes.dart';
import 'all_feedbacks_view.dart';


class FeedbackView extends GetView<FeedbackController>{
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: CustomFAB(isIcon: true, buttonText: 'Feedback &\nHelp',icon: Icons.add,onButtonClicked: (){
        Get.toNamed(Routes.addFeedbackView,arguments: {'isEdit': false});
      },),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Feedback & Help',
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: buildSchoolDropDown(controller.schoolItems, controller.selectedSchool, 'Hint', 100.w),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: BaseTabBar(

                tabController: controller.controller,
                tabList: [
              Tab(
                text: 'All'.tr,
              ),
              Tab(
                text: 'Help'.tr,
              ),
              Tab(
                text: 'Feedback'.tr,
              ),
            ]),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.controller,
              children: const [
                AllFeedbacksView(type: 1,),
                AllFeedbacksView(type: 2,),
                AllFeedbacksView(type: 3,),
              ],
            ),
          )



        ],
      ),
    );
  }


}