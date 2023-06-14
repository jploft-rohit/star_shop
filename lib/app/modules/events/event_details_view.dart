import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/controller/events_controller.dart';
import 'package:star_shop/common/bordered_button.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/edgy_bordered_button.dart';
import 'package:star_shop/common/success_dialog.dart';

import '../../../common/app_header.dart';
import '../../../common/base_detail_data.dart';
import '../../../common/utils.dart';

class EventDetailsView extends GetView<EventsController>{
  const EventDetailsView({super.key});
  void showApproveDialog(){
    Get.dialog(
        Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.transparent,
                    ),
                  ),
                  addText('Event Rejection Reason', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: ColorConstants.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: getEditTextDecoration(),
                child: buildLineEditText(controller.reasonController!, 'Why are you rejecting this event?'),
              ),

              SizedBox(
                height: 2.h,
              ),

              GestureDetector(
                onTap: (){},
                child: BorderedButton(width: 40.w, text: 'SUBMIT'),
              )



            ],
          ),
        ),
      ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Event Details',
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText(
                              'School Picnic',
                              16,
                              Colors.black,
                              FontWeight.bold,
                            ),
                            buildDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: richTile(
                                    maxLines: 20,
                                    icon: 'assets/images/fab_calendar.svg',
                                    title: 'Create Date',
                                    value: '01/03/2022',
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 20,
                                  alignment: Alignment.center,
                                  color: const Color(0XFFC4C4C4),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: richTile(
                                    maxLines: 20,
                                    icon: 'assets/images/ic_clock.svg',
                                    title: 'Create Time',
                                    value: '09:13pm',
                                  ),
                                ),
                              ],
                            ),
                            buildDivider(),
                            richTile(
                              icon: 'assets/images/ic_complaints.svg',
                              title: 'Event Type',
                              value: 'Intside school',
                            ),
                            buildDivider(),
                            richTile(
                              icon: 'assets/images/ic_complaints.svg',
                              title: 'Description',
                              value:
                              'We are hosting a event as School Picnic for the stars to cheer up with the school mats inside the school will have a lot of activity to do for fun. all the interested stars can register for the event.',
                            ),
                            buildDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/fab_calendar.svg',
                                  title: 'Start Date Time',
                                  value: '09/09/2022',
                                ),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_clock.svg',
                                  title: '09:13pm',
                                  value: '',
                                ),
                              ],
                            ),
                            buildDivider(),
                            richTile(
                              icon: 'assets/images/ic_complaints.svg',
                              title: 'Start Destination',
                              value: 'Ignite Public School',
                            ),
                            buildDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/fab_calendar.svg',
                                  title: 'End Date Time',
                                  value: '09/09/2022',
                                ),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_clock.svg',
                                  title: '09:13pm',
                                  value: '',
                                ),
                              ],
                            ),
                            buildDivider(),
                            richTile(
                              icon: 'assets/images/ic_complaints.svg',
                              title: 'End Destination',
                              value: 'Ignite Public School',
                            ),
                            buildDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/fab_calendar.svg',
                                  title: 'Reporting Date Time',
                                  value: '09/09/2022',
                                ),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_clock.svg',
                                  title: '09:13pm',
                                  value: '',
                                ),
                              ],
                            ),
                            buildDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/fab_calendar.svg',
                                  title: 'End for Registration',
                                  value: '09/09/2022',
                                ),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_clock.svg',
                                  title: '09:13pm',
                                  value: '',
                                ),
                              ],
                            ),
                            buildDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_complaints.svg',
                                  title: 'Transport Facility',
                                  value: 'No',
                                ),
                                richTile(
                                  maxLines: 20,
                                  title: 'Canteen Facility',
                                  value: 'Yes',
                                ),
                              ],
                            ),
                            // buildDivider(),
                            SizedBox(
                              height: 18,
                            ),
                            addText(
                              'Meals',
                              16,
                              Colors.black,
                              FontWeight.bold,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: richTile(
                                    maxLines: 20,
                                    icon: 'assets/images/user2.svg',
                                    title: 'Staff',
                                    value: '20 meals',
                                  ),
                                ),
                                Expanded(
                                  child: richTile(
                                    maxLines: 20,
                                    icon: 'assets/images/user2.svg',
                                    title: 'Teacher',
                                    value: '30 meals',
                                  ),
                                ),
                              ],
                            ),
                            buildDivider(),
                            Row(
                              children: [
                                Expanded(
                                  child: richTile(
                                    maxLines: 20,
                                    icon: 'assets/images/user2.svg',
                                    title: 'Nurse',
                                    value: '10 meals',
                                  ),
                                ),
                                Expanded(
                                  child: richTile(
                                    maxLines: 20,
                                    title: 'Security Staff',
                                    value: '10 meals',
                                    icon: 'assets/images/user2.svg',
                                  ),
                                ),
                              ],
                            ),
                            // buildDivider(),
                            SizedBox(
                              height: 18,
                            ),
                            addText(
                              'Meals Type',
                              16,
                              Colors.black,
                              FontWeight.bold,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            richTile(
                             // icon: 'assets/images/ic_complaints.svg',
                              title: 'Meal Type 1',
                             // value: 'Ignite Public School',
                              value: '',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            richTile(
                              icon: 'assets/images/ic_complaints.svg',
                              title: 'Quantity',
                              value: '2 unit',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            richTile(
                              icon: 'assets/images/ic_complaints.svg',
                              title: 'Description',
                              value: 'Make Food less spicy !!',
                            ),

                            buildDivider(),
                            richTile(
                              // icon: 'assets/images/ic_complaints.svg',
                              title: 'Meal Type 2',
                              // value: 'Ignite Public School',
                              value: '',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            richTile(
                              icon: 'assets/images/ic_complaints.svg',
                              title: 'Quantity',
                              value: '4 unit',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            richTile(
                              icon: 'assets/images/ic_complaints.svg',
                              title: 'Description',
                              value: 'Make Food spicy !!',
                            ),

                            SizedBox(
                              height: 14,
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: const Color(0XFFE3E3E3),
                            //     ),
                            //     borderRadius: BorderRadius.circular(12),
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(10),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         addText(
                            //           'Stars:',
                            //           16,
                            //           Colors.black,
                            //           FontWeight.bold,
                            //         ),
                            //         const SizedBox(height: 10),
                            //         GridView.builder(
                            //           physics: const NeverScrollableScrollPhysics(),
                            //           gridDelegate:
                            //           const SliverGridDelegateWithFixedCrossAxisCount(
                            //               crossAxisCount: 2,
                            //               childAspectRatio: 4.5),
                            //           shrinkWrap: true,
                            //           itemCount: 6,
                            //           itemBuilder: (context, index) {
                            //             return Row(
                            //               children: [
                            //                 SvgPicture.asset(
                            //                   'assets/images/star.svg',
                            //                   width: 20,
                            //                 ),
                            //                 const SizedBox(width: 10),
                            //                 addText(
                            //                   'Sania Khan',
                            //                   14,
                            //                   Colors.black,
                            //                   FontWeight.normal,
                            //                 ),
                            //               ],
                            //             );
                            //           },
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(height: 20),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: richTile(
                            //         maxLines: 20,
                            //         icon: 'assets/images/ic_complaints.svg',
                            //         title: 'Grade',
                            //         value: 'Grade4',
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: richTile(
                            //         maxLines: 20,
                            //         title: 'Class',
                            //         value: 'H1, H2, H3',
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // buildDivider(),
                            // richTile(
                            //   maxLines: 20,
                            //   icon: 'assets/images/ic_complaints.svg',
                            //   title: 'Stars',
                            //   value: '40',
                            // ),
                            // buildDivider(),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: richTile(
                            //         maxLines: 20,
                            //         icon: 'assets/images/ic_complaints.svg',
                            //         title: 'Grade',
                            //         value: 'Grade5',
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: richTile(
                            //         maxLines: 20,
                            //         title: 'Class',
                            //         value: 'H1, H2, H3',
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // buildDivider(),
                            // richTile(
                            //   maxLines: 20,
                            //   icon: 'assets/images/user2.svg',
                            //   title: 'Stars',
                            //   value: '40',
                            // ),
                            // buildDivider(),
                            // richTile(
                            //   maxLines: 20,
                            //   icon: 'assets/images/user2.svg',
                            //   title: 'Total Passenger',
                            //   value: '86',
                            // ),
                            // const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap:showApproveDialog,
                                    child: EdgyBorderedButton(width: 100.w, text: 'APPROVE')),
                                  ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      Get.dialog(const SuccessDialog(message: 'Your event approved!'));
                                    },
                                    child: EdgyBorderedButton(width: 100.w, text: 'REJECT',isActive: false,),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }


  Widget richTile({
    String? icon,
    double iconSize = 13,
    required String title,
    required String value,
    decoration = false,
    TextStyle? titleStyle,
    TextStyle? valueStyle,
    bool isCenter = false,
    double? maxLines,
    WidgetSpan? widgetSpan,
    double height = 1,
  }) {
    return BaseDetailData(
      detailsLable: title,
      detailsValue: value,
      icon: icon ?? '',
    );
  }


}