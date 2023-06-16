
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/assignments/worksheet_view.dart';
import 'package:star_shop/common/delete_dialog.dart';

import '../../../common/bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/custom_stepper.dart';
import '../../../common/utils.dart';
import '../../controller/complain_controller.dart';
import '../../routes/app_routes.dart';

class AllComplaints extends GetView<ComplainController> {
  const AllComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildComplainList(context),
          ],
        ),
      ),
    );
  }

  Widget buildComplainList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  boxShadow: [getBoxShadow()],
                  borderRadius: getBorderRadius(),
                  color: ColorConstants.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: addText(
                                'Behaviour is not good',
                                getNormalTextFontSIze(),
                                ColorConstants.black,
                                FontWeight.bold)),
                        GestureDetector(
                          onTap: () {
                            showDocumentPopup(context, 'Complaint & Report');
                          },
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: ColorConstants.primaryColor,
                            size: getHeadingTextFontSIze(),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.download_for_offline,
                            color: ColorConstants.primaryColor,
                            size: getHeadingTextFontSIze(),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.raiseComplain,
                                arguments: {'isEdit': true});
                          },
                          child: SvgPicture.asset(
                            'assets/images/ic_edit.svg',
                            height: getHeadingTextFontSIze(),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(const DeleteDialog(message: 'Are you sure you want to delete this ?'));
                          },
                          child: SvgPicture.asset(
                            'assets/images/ic_delete.svg',
                            height: getHeadingTextFontSIze(),
                          ),
                        ),
                      ],
                    ),
                    buildDivider(),
                    buildLongReason('user2', 'Star', 'Najma Suha-il'),
                    buildDivider(),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/ic_calendar.svg',
                                height: getHeadingTextFontSIze()),
                            const SizedBox(
                              width: 10,
                            ),
                            addText('01/03/2022', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.w500)
                          ],
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/ic_time.svg',
                              height: getHeadingTextFontSIze(),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            addText('09:13pm', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.w500)
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    buildDivider(),
                    buildLongReason('ic_complaints', 'Type', 'Complaints'),
                    buildDivider(),
                    buildLongReason(
                        'ic_complaints', 'Complain On', 'Bus Driver'),
                    buildDivider(),
                    buildLongReason('user2', 'Person', 'Ibrahim Khan'),
                    buildDivider(),
                    buildLongReason(
                        'ic_complaints', 'Complain Type', 'Bullying'),
                    buildDivider(),
                    const BaseDetailData(icon: "assets/images/ic_complaints.svg", detailsLable: "Comment", detailsValue: "Behavior of the driver are not good with me please take some action or ask him to understand the concern."),
                    if (index != 0) buildDivider(),
                    if (index != 0)
                      buildLongReason('feedback', 'Feedback',
                          'We will take action on this.'),
                    const SizedBox(
                      height: 10,
                    ),

                    //
                    // if (index != 0)
                    //   SizedBox(
                    //     height: 4.h,
                    //     child: ListView.builder(
                    //       itemCount: controller.feedbackList.length,
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       itemBuilder: (context, index) {
                    //         return Obx(() => GestureDetector(
                    //               onTap: () {
                    //                 // controller.selectedFeedbackPos.value = index;
                    //                 if (index == 1) {
                    //                   showCommentDialog();
                    //                 }
                    //               },
                    //               child: Container(
                    //                 height: 4.h,
                    //                 width: 22.w,
                    //                 margin: const EdgeInsets.only(right: 10),
                    //                 decoration:
                    //                     controller.selectedFeedbackPos.value ==
                    //                             index
                    //                         ? getPrimaryDecoration3()
                    //                         : getEditTextDecoration(),
                    //                 child: Center(
                    //                     child: addText(
                    //                         controller.feedbackList[index],
                    //                         getSmallTextFontSIze(),
                    //                         controller.selectedFeedbackPos
                    //                                     .value ==
                    //                                 index
                    //                             ? ColorConstants.primaryColor
                    //                             : ColorConstants.borderColor,
                    //                         FontWeight.normal)),
                    //               ),
                    //             ));
                    //       },
                    //     ),
                    //   ),


                    if (index != 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Flexible(child: GestureDetector(
                        //   onTap: () {
                        //   },
                        //   child: Container(
                        //     height: 4.h,
                        //     decoration: getEditTextDecoration(),
                        //     child: Center(
                        //         child: addText(
                        //             'ESCALATE',
                        //             getSmallTextFontSIze(),
                        //             ColorConstants.borderColor,
                        //             FontWeight.normal)),
                        //   ),
                        // )),
                        // const SizedBox(width: 5,),
                        Flexible(child: GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            height: 4.h,
                            decoration:getPrimaryDecoration3(),
                            child: Center(
                                child: addText(
                                    'ACCEPT',
                                    getSmallTextFontSIze(),
                                    ColorConstants.primaryColor,
                                    FontWeight.normal)),
                          ),
                        )),
                        const SizedBox(width: 5,),
                        Flexible(child: GestureDetector(
                          onTap: () {
                            showCommentDialog();
                          },
                          child: Container(
                            height: 4.h,
                            decoration:
                            getEditTextDecoration(),
                            child: Center(
                                child: addText(
                                    'COMMENTS',
                                    getSmallTextFontSIze(),
                                    ColorConstants.borderColor,
                                    FontWeight.normal)),
                          ),
                        )),
                      ],
                    ),



                    buildDivider(),
                    if (index == 0)
                      StepProgressView(
                          width: MediaQuery.of(context).size.width,
                          curStep: 2,
                          statuses: controller.heading,
                          color: ColorConstants.primaryColor,
                          titles: const ['July 2', '', '']),
                    if (index == 1)
                      StepProgressView(
                          width: MediaQuery.of(context).size.width,
                          curStep: 3,
                          statuses: controller.heading,
                          color: ColorConstants.primaryColor,
                          titles: const ['July 2', 'July 3', '      ']),
                    if (index == 2)
                      StepProgressView(
                          width: MediaQuery.of(context).size.width,
                          curStep: 4,
                          statuses: controller.heading,
                          color: ColorConstants.primaryColor,
                          titles: const ['July 2', 'July 3', 'July 4']),
                  ],
                ),
              ),
              if (index == 2)
                SizedBox(
                  height: 15.h,
                )
            ],
          );
        },
      ),
    );
  }

  buildLongReason(String image, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/images/$image.svg',
          height: getHeadingTextFontSIze(),
        ),
        const SizedBox(
          width: 10,
        ),
        addText('$title : ', getSmallTextFontSIze() + 1, ColorConstants.black,
            FontWeight.normal),
        Expanded(
          child: addText(' $description', getSmallTextFontSIze() + 1,
              ColorConstants.primaryColor, FontWeight.bold),
        ),
      ],
    );
  }

  void showCommentDialog() {
    Get.dialog(Scaffold(
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
                  addText('Add Comment', getSubheadingTextFontSIze(),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: getEditTextDecoration(),
                child:
                    buildLineEditText(controller.commentController!, 'Comment'),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {},
                child: BorderedButton(width: 40.w, text: 'SUBMIT'),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
