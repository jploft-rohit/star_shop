import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/base_tab_bar.dart';
import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/custom_fab.dart';
import '../../../common/utils.dart';
import '../../controller/complain_controller.dart';
import '../../routes/app_routes.dart';
import 'all_complain_view.dart';

class ComplainView extends GetView<ComplainController>{
  const ComplainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: CustomFAB(isIcon: true, buttonText: 'Complain or\nReport',icon: Icons.add,onButtonClicked: (){
        Get.toNamed(Routes.raiseComplain,
            arguments: {'isEdit': false});
      },),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Complaints & Report',
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
                text: 'Complaints'.tr,
              ),
              Tab(
                text: 'Reports'.tr,
              ),
            ]),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.controller,
              children: const [
                AllComplaints(),
                AllComplaints(),
                AllComplaints(),
              ],
            ),
          )



        ],
      ),
    );
  }


}