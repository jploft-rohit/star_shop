
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/annual_schedule/annual_schedule.dart';

import '../../../../../common/color_constants.dart';
import '../../../../../common/utils.dart';
import '../../../../controller/my_profile_controller.dart';
import '../../../../routes/app_routes.dart';


class AccountView extends GetView<MyProfileController>{
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.attendanceView);
                },
                child: buildItem('My Attendance'),
              ),
              SizedBox(height: 1.h,),

              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.performanceView);
                },
                child: buildItem('My Performance'),
              ),
              SizedBox(height: 1.h,),

              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.earlyLeave);
                },
                child: buildItem('Early Leave'),
              ),
              SizedBox(height: 1.h,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.leavePermission);
                },
                child: buildItem('Leave Permissions'),
              ),
              SizedBox(height: 1.h,),

              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.leaveRequestView);
                },
                child: buildItem('Leave Request'),
              ),
              SizedBox(height: 1.h,),

              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.medicalRecordView);
                },
                child: buildItem('Medical Records'),
              ),
              SizedBox(height: 1.h,),

              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.notificationSettings);
                },
                child: buildItem('Notification Settings'),
              ),
              SizedBox(height: 1.h,),


              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.complainView);
                },
                child: buildItem('Complaints & Reports'),
              ),
              SizedBox(height: 1.h,),


              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.feedbackView);
                },
                child: buildItem('Feedback & Help'),
              ),
              SizedBox(height: 1.h,),


              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.cardTagsView);
                },
                child: buildItem('Card & Tags'),
              ),
              SizedBox(height: 1.h,),

              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.taskReminderView);
                },
                child: buildItem('Tasks and Reminders'),
              ),
              SizedBox(height: 1.h,),
              GestureDetector(
                onTap: (){
                  Get.to(const AnnualScheduleScreen());
                },
                child: buildItem('Annual Schedule'),
              ),
              SizedBox(height: 1.h,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.walletView,arguments: {
                    'heading' : 'Wallet'
                  });
                },
                child: buildItem('Wallet'),
              ),
              SizedBox(height: 1.h,),

              // FadeInRight(
              //   duration: const Duration(milliseconds: 700),
              //   child: GestureDetector(
              //     onTap: (){
              //       Get.toNamed(Routes.awarenessView);
              //     },
              //     child: buildItem('Awareness & Courses'),
              //   ),
              // ),
              //
              // SizedBox(height: 1.h,),

              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.transportationBaseView);
                },
                child: buildItem('Transportation'),
              ),

              SizedBox(height: 1.h,),

              SizedBox(height: 5.h,),


            ],
          ),
        ),
      ),
    );
  }



  Widget buildItem(String title){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstants.primaryColor
        ),
        borderRadius: getBorderRadius()
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         addText(title, getSubheadingTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
         const Icon(Icons.arrow_forward,color: ColorConstants.primaryColor,)
       ],
      ),
    );
  }

}