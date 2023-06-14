import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../common/circular_bordered_button.dart';
import '../../../../../common/color_constants.dart';
import '../../../../../common/utils.dart';
import '../../../../controller/my_profile_controller.dart';
import '../../../../routes/app_routes.dart';


class ProfileDetails extends GetView<MyProfileController>{
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
             buildMyInformation(context),
              SizedBox(height: 2.h,),
              buildJobDetails(context),
              SizedBox(height: 10.h,),


            ],
          ),
        ),
      ),
    );
  }

  Widget buildMyInformation(BuildContext context){
    return  Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: getCurvedBorderRadius(),
          side: const BorderSide(color: ColorConstants.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Theme(
          data: Theme.of(context)
              .copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              iconColor: ColorConstants.primaryColor,
              collapsedIconColor: ColorConstants.primaryColor,
              tilePadding: EdgeInsets.zero,
              title: addText(
                  'My Information',
                  getHeadingTextFontSIze(),
                  ColorConstants.black,
                  FontWeight.bold),
              backgroundColor: ColorConstants.white,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildInfoItems('Mobile No', '9563214563'),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.editProfileView);
                      },
                      child: Container(
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryColorLight,
                            // boxShadow: [getDeepBoxShadow()],
                            border: Border.all(
                                color: ColorConstants.primaryColor,
                                width: 1.5),
                            borderRadius: getBorderRadiusCircular()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Center(
                            child: addText(
                                'EDIT',
                                getNormalTextFontSIze(),
                                ColorConstants.primaryColor,
                                FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                buildInfoItems(
                    'Alternative Mobile', '9795214563'),
                buildInfoItems(
                    'Email', 'rafiq_khan007@gmail.com'),
                buildInfoItems('DOB', '17 March, 1985'),
                buildInfoItems(
                    'Address', 'PO Box: 9440 Dubai UAE'),
                buildInfoItems('Country', 'UAE'),
                buildInfoItems('Sector', 'Dubai'),
                buildInfoItems('Marital status', 'Married'),
                buildInfoItems('Nationality', 'Pakistan'),
                buildInfoItems('Emirates ID', 'GT65349'),
                buildInfoItems('Expiry Date', '15 Sep, 2025'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    buildInfoItems('Uploaded Document', 'rafiq.doc'),
                    GestureDetector(
                      onTap: (){},
                      child: Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,),
                    )


                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     buildInfoItems('Emirates ID', 'GT65349'),
                //     buildInfoItems('Expiry Date', '15 Sep, 2025')
                //   ],
                // ),
                SizedBox(height: 2.h,)
              ]),
        ),
      ),
    );
  }

  Widget buildJobDetails(BuildContext context){
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: getCurvedBorderRadius(),
          side: const BorderSide(color: ColorConstants.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Theme(
          data: Theme.of(context)
              .copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              iconColor: ColorConstants.primaryColor,
              collapsedIconColor: ColorConstants.primaryColor,
              tilePadding: EdgeInsets.zero,
              title: addText(
                  'Job Details',
                  getHeadingTextFontSIze(),
                  ColorConstants.black,
                  FontWeight.bold),
              backgroundColor: ColorConstants.white,
              children: <Widget>[

                buildInfoItems('Designation' , 'Canteen Admin'),
                buildInfoItems('Company' , 'Delta Pvt. Ltd.'),
                buildInfoItems('Contract Start Date' , '23 May, 2019'),
                buildInfoItems('Contract End Date' , '23 Jul, 20120'),

                SizedBox(height: 2.h,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: addText('Job Title', getSubheadingTextFontSIze(), ColorConstants.black, FontWeight.bold)),
                Container(
                  margin: EdgeInsets.only(top: 1.h,bottom: 2.h),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.primaryColor),
                      borderRadius: getBorderRadius()
                  ), child: Row(
                  children: [
                    SvgPicture.asset('assets/images/trips_completed.svg',height: getLargeTextFontSIze(),),
                    const SizedBox(width: 10,),
                    addText('Canteen Staff', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold)
                  ],
                ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: addText('Authority & Roles', getHeadingTextFontSIze(), ColorConstants.black, FontWeight.bold)),
                SizedBox(height: 1.h,),
                Container(
                  margin: EdgeInsets.only(top: 1.h,bottom: 2.h),
                  padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 5+1.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.primaryColor),
                      borderRadius: getBorderRadius()
                  ), child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/images/ic_authority.svg',height: getLargeTextFontSIze(),),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addText('1. Tap to detect', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
                        SizedBox(height: 1.h,),
                        addText('2. Refund transaction', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
                        SizedBox(height: 1.h,),
                        addText('3. Change Item details', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
                        SizedBox(height: 1.h,),
                        addText('4. Change Item amount', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
                        SizedBox(height: 1.h,),
                        addText('5. Change Item quantity', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
                        SizedBox(height: 1.h,),
                        addText('6. Add new item', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
                        SizedBox(height: 1.h,),
                        addText('7. Pre-order', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
                      ],
                    )
                  ],
                ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Contract Certificate', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                    Row(
                      children:  [
                        GestureDetector(
                            onTap: (){
                              showDocumentPopup(context, 'Contract Certificate');
                            },
                            child: const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,)),
                        const SizedBox(width: 10,),
                        const Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,)
                      ],
                    )



                  ],
                ),
                const Divider(
                  color: ColorConstants.primaryColor,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     addText('Salary Certificate', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                //     Row(
                //       children:  [
                //         GestureDetector(
                //             onTap: (){
                //               showDocumentPopup(context, 'Salary Certificate');
                //             },
                //             child: const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,)),
                //         const SizedBox(width: 10,),
                //         const Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,)
                //       ],
                //     )
                //
                //
                //
                //   ],
                // ),
                // const Divider(
                //   color: ColorConstants.primaryColor,
                // ),
                //
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     addText('Job Description', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                //     Row(
                //       children:  [
                //         GestureDetector(
                //             onTap: (){
                //               showDocumentPopup(context, 'Job Description');
                //             },
                //             child: const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,)),
                //         const SizedBox(width: 10,),
                //         const Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,)
                //       ],
                //     )
                //
                //
                //
                //   ],
                // ),
                // const Divider(
                //   color: ColorConstants.primaryColor,
                // ),


               GestureDetector(
                 onTap: (){
                   Get.toNamed(Routes.salarySlipView);
                 },
                 child:  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     addText('Salary Slip', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                     const Icon(Icons.arrow_forward,color: ColorConstants.primaryColor,)


                   ],
                 ),
               ),
                const SizedBox(height: 20,),








              ]),
        ),
      ),
    );
  }



  Widget buildVerticalItems(String title,String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              addText(title, getSmallTextFontSIze(), ColorConstants.black,
                  FontWeight.normal),
              addText(description, getSmallTextFontSIze(), ColorConstants.primaryColor,
                  FontWeight.bold),
        ],
      ),
    );
  }

  Widget buildFamilyItem(int index,BuildContext context){
    return Container(
      width: 100.w,
      margin:  const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: ColorConstants.white,
          border: Border.all(color: ColorConstants.primaryColorLight,width: 2),
          borderRadius: getCurvedBorderRadius()),
      child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     buildInfoItems('Name', 'Salma Khan'),
                     buildInfoItems('Relation', 'Mother'),
                   ],
                 ),
                  Row(
                    children: [
                      GestureDetector(onTap: (){},
                      child: SvgPicture.asset('assets/images/ic_edit.svg'),
                      ),
                      const SizedBox(width: 20,),
                      GestureDetector(onTap: (){
                        showDeleteDialog(context, index);
                      },
                        child: SvgPicture.asset('assets/images/ic_delete.svg'),
                      ),
                    ],
                  )


                ],
              ),
            ],
          )
      ),
    );
  }

  showDeleteDialog(BuildContext context,int index){

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
            backgroundColor: ColorConstants.white,
            elevation: 10,

            scrollable: true,
            title: Stack(
              children: [
                Align(alignment: Alignment.center,
                  child: addAlignedText(
                      "Remove Family Member",
                      getHeadingTextFontSIze(),
                      ColorConstants.black,
                      FontWeight.w600),),

                Align(alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: ColorConstants.borderColor,
                      ),
                    ))
              ],
            ),
            contentPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: getCurvedBorderRadius()),
            content: SizedBox(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    addText('Reason :', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                    const SizedBox(height: 5,),
                    Container(
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: ColorConstants.etBgColor,
                        border: Border.all(color: ColorConstants.borderColor2),
                        borderRadius: getEdgyBorderRadius()
                      ),
                    ),
                     SizedBox(height: 2.h ,),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: (){},
                        child: CircularBorderedButton(width: 35.w, text: 'DELETE'),
                      ),
                    )

                  ],
                ),
              ),
            )));


  }



}