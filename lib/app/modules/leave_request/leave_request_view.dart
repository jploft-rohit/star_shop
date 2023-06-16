
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/delete_dialog.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/custom_fab.dart';
import '../../../common/custom_stepper.dart';
import '../../../common/utils.dart';
import '../../controller/leave_request_controller.dart';
import '../../routes/app_routes.dart';
import 'leave_balance_dialog.dart';
import 'upload_evidence_dialog.dart';


class LeaveRequestView extends GetView<LeaveRequestController>{
  const LeaveRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: CustomFAB(isIcon: true, buttonText: 'Leave Request',icon: Icons.add,onButtonClicked: (){
        controller.leaveRequestButtonText.value = 'SUBMIT';
        Get.toNamed(Routes.requestLeave);
      },),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Leave Request',
          )),
      body: Column(
        children: [

          SizedBox(height: 1.h,),
          IntrinsicHeight (
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Flexible(
                  flex: 4,
                  child: Container(
                  width: 100.w,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: getBorderRadius(),
                      // boxShadow: [getBoxShadow()],
                      border: Border.all(color: ColorConstants.borderColor),
                      color: ColorConstants.primaryColorLight),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: buildLeaveTypeDropDown(),
                ),),


                Flexible(
                    flex: 5,
                    child: GestureDetector(
                      onTap: (){
                        Get.dialog(const LeaveBalanceDialog());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 100.w,
                        decoration: getPrimaryDecoration(),
                        child: Center(child: addText('CHECK LEAVE BALANCE', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold)),
                      ),
                    ))

              ],
            ),
          ),
          SizedBox(height: 1.h,),
          buildRequests(context)

        ],
      ),
    );
  }

  Widget buildRequests(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  boxShadow: [getBoxShadow()],
                  borderRadius: getBorderRadius(),
                  color: ColorConstants.white,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        addText('Leave Type : ', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                        addText(index.isEven ? 'CL' : 'SL', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                        const Spacer(),

                        GestureDetector(onTap: (){

                          Get.dialog(const DeleteDialog(message: 'Are you sure you want to delete this?'));

                        }, child: SvgPicture.asset('assets/images/ic_delete.svg',height: getHeadingTextFontSIze(),),),
                        SizedBox(width: 5.w,),
                        GestureDetector(onTap: (){
                          controller.leaveRequestButtonText.value = 'UPDATE';
                          Get.toNamed(Routes.requestLeave);
                        }, child: SvgPicture.asset('assets/images/ic_edit.svg',height: getHeadingTextFontSIze())),
                        SizedBox(width: 5.w,),
                        GestureDetector(
                          onTap: (){
                            Get.dialog(const UploadEvidenceDialog());
                          },
                          child: Column(
                            children: [
                              GestureDetector(onTap: (){}, child: SvgPicture.asset('assets/images/ic_upload.svg',color: ColorConstants.primaryColor,height: getHeadingTextFontSIze())),
                              addAlignedText('Upload\nEvidence', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                            ],
                          ),
                        ),
                      ],
                    ),
                    buildDivider(),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/fab_calendar.svg',
                                height: getHeadingTextFontSIze()),
                            const SizedBox(width: 10,),
                            addText('01/03/2022', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.w500)
                          ],
                        ),
                        const Spacer(),
                        addText('to', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/fab_calendar.svg',
                                height: getHeadingTextFontSIze()),
                            const SizedBox(width: 10,),
                            addText('01/03/2022', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.w500)
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    buildDivider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_reason.svg',
                          height: getHeadingTextFontSIze(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        addText('Reason', getSmallTextFontSIze() + 1,
                            ColorConstants.black, FontWeight.normal),
                        Expanded(
                          child: addText(
                              ' : Lorem Ipsum is simply dummy text...',
                              getSmallTextFontSIze() + 1,
                              ColorConstants.primaryColor,
                              FontWeight.bold),
                        ),
                      ],
                    ),

                    buildDivider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_reason.svg',
                          height: getHeadingTextFontSIze(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        addText('Comment', getSmallTextFontSIze() + 1,
                            ColorConstants.black, FontWeight.normal),
                        Expanded(
                          child: addText(
                              ' : Ok I will talk to her',
                              getSmallTextFontSIze() + 1,
                              ColorConstants.primaryColor,
                              FontWeight.bold),
                        ),
                      ],
                    ),

                    if(index == 1)
                      buildDivider(),
                    if(index == 1)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_reason.svg',
                            height: getHeadingTextFontSIze(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          addText('Evidence', getSmallTextFontSIze() + 1,
                              ColorConstants.black, FontWeight.normal),
                          Row(
                            children: [
                              addText(
                                  ' : Ok I will talk to her',
                                  getSmallTextFontSIze() + 1,
                                  ColorConstants.primaryColor,
                                  FontWeight.bold),

                              SizedBox(width: 4.w,),

                              GestureDetector(
                                onTap: (){
                                  showDocumentPopup(context, 'Leave Request');
                                },
                                child: Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),
                              ),
                              SizedBox(width: 3.w,),
                              GestureDetector(
                                onTap: (){},
                                child: Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),
                              ),


                            ],
                          ),
                        ],
                      ),

                    buildDivider(),



                    if(index == 0)
                      StepProgressView(width: MediaQuery.of(context).size.width,
                          curStep: 3,
                          statuses: const ['Request\nRaised','Request\nAccepted','Evidence\nSubmitted','Evidence\nApproved'],
                          color: ColorConstants.primaryColor,
                          titles: controller.dates),



                    if(index == 1)
                      StepProgressView(width: MediaQuery.of(context).size.width,
                          curStep: 4,
                          statuses: const ['Request\nRaised','Request\nAccepted','Evidence\nSubmitted','Evidence\nApproved'],
                          color: ColorConstants.primaryColor,
                          titles: controller.dates),




                  ],
                ),
              ),

              if(index == 1)
                SizedBox(height: 15.h,)


            ],
          );
        },
      ),
    );
  }




  Widget buildLeaveTypeDropDown() {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          isDense: true,
          items: controller.leaveItems
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: getNormalTextFontSIze(),
                fontWeight: FontWeight.normal,
                color: ColorConstants.gretTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value: controller.selectedLeaveType.value,
          onChanged: (value) {
            controller.selectedLeaveType.value = value.toString();
          },
          icon:  Icon(
            Icons.arrow_drop_down_rounded,
            size: getLargeTextFontSIze(),
            color: ColorConstants.lightTextColor,
          ),
          iconSize: 14,
          iconEnabledColor: ColorConstants.gretTextColor,
          iconDisabledColor: Colors.grey,
          buttonWidth: 80.w,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 50.h,
          dropdownWidth: 50.w,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          dropdownElevation: 1,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(-20, 0),
        ),
      )),
    );
  }

}