import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/success_dialog.dart';

import '../../../common/app_header.dart';
import '../../../common/main_btn.dart';
import '../../controller/sos/sos_controller.dart';
import '../qr_scanner/sos_scanQR.dart';


class SosView extends GetView<SosController> {
  const SosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'SOS',
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    dropDown(),
                    const SizedBox(height: 20),
                    Obx(
                      () => GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.2,
                        children: [
                          GestureDetector(
                            onTap: () => controller.changeActiveBox('fight'),
                            child: singleBox(
                              title: 'Fight',
                              icon: 'assets/images/fight.svg',
                              isActive: controller.activeBox.value == 'fight',
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.changeActiveBox('fire'),
                            child: singleBox(
                              title: 'Fire Emergency',
                              icon: 'assets/images/fire.svg',
                              isActive: controller.activeBox.value == 'fire',
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.changeActiveBox('medical'),
                            child: singleBox(
                              title: 'Medical Support',
                              icon: 'assets/images/first-aid-kit.svg',
                              isActive: controller.activeBox.value == 'medical',
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.changeActiveBox('other'),
                            child: singleBox(
                              title: 'Other',
                              icon: 'assets/images/other.svg',
                              isActive: controller.activeBox.value == 'other',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => controller.activeBox.value == 'fight'
                          ? fightTab()
                          : controller.activeBox.value == 'fire'
                              ? fireEmegenyTab()
                              : controller.activeBox.value == 'medical'
                                  ? medicalTab()
                                  : otherTab(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dropDown() {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: ColorConstants.secondaryColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color(0XFFBECADA),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: DropdownButtonFormField(
          // focusColor: ColorConstants.secondaryColor,
          // dropdownColor: ColorConstants.secondaryColor,
          decoration: const InputDecoration(
            // focusColor: ColorConstants.secondaryColor,
            // fillColor: ColorConstants.secondaryColor,
            border: InputBorder.none,
            labelText: 'Ignite Public School',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          items: const [
            DropdownMenuItem(
              value: 'Ignite Public School',
              child: Text('Ignite Public School'),
            ),
            // DropdownMenuItem(
            //   child: Text('Ignite Public School'),
            //   value: 'Ignite Public School',
            // ),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget fightTab() {
    return Obx(
      () => Column(
        children: [
          const SizedBox(height: 20),
          tabs(),
          const SizedBox(height: 30),
          search(
            icon: SvgPicture.asset(
              'assets/images/${controller.activeTab.value}.svg',
              width: 30,
              color: ColorConstants.primaryColor,
            ),
          ),
          const SizedBox(height: 30),
          fullStars(children: [
            star(),
            star(),
            star(),
            star(last: true),
          ]),
          const SizedBox(height: 10),
          controller.activeTab.value == 'hand'
              ? Column(
                  children: [
                    labSearch(),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: mainBtn(
                            text: 'notify',
                            radius: 19,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                )
              : Column(
                  children: [
                    search(
                      icon: SvgPicture.asset(
                        'assets/images/${controller.activeTab.value}.svg',
                        width: 30,
                        color: ColorConstants.primaryColor,
                      ),
                      hintText: 'Search Location',
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: SizedBox(
                      width: 200,
                      height: 50,
                      child: mainBtn(
                        text: 'notify',
                        radius: 19,
                          onTap: ()=>Get.dialog(const SuccessDialog(message: 'Notified Successfully'))
                      ),
                    )),
                    const SizedBox(height: 30),
                  ],
                )
        ],
      ),
    );
  }

  Widget fireEmegenyTab() {
    return Obx(
      () => Column(
        children: [
          const SizedBox(height: 30),
          search(
            icon: SvgPicture.asset(
              'assets/images/nfc.svg',
              width: 30,
              color: ColorConstants.primaryColor,
            ),
            hintText: 'Classroom 1 -F1',
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 200,
              height: 50,
              child: mainBtn(
                text: 'notify',
                radius: 19,
                onTap: () => Get.toNamed(Routes.fireEmergency),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Column fullStars({String title = 'Stars', List<Widget> children = const []}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: children,
            ),
          ),
        ),
      ],
    );
  }

  Column star({last = false, isLab = false, title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (controller.activeBox.value == 'medical') {
                  openMedicalSupportDialog(Get.context);
                } else {
                  openSelectStarsDialog(Get.context);
                }
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    isLab
                        ? 'assets/images/location-pin.svg'
                        : 'assets/images/star.svg',
                    width: isLab ? 10 : 15,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    isLab ? title : 'Sania Khan (#455285)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isLab ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            isLab
                ? Container()
                : SvgPicture.asset(
                    'assets/images/delete.svg',
                    width: 20,
                  ),
          ],
        ),
        !last
            ? Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
              )
            : Container(),
        !last ? const SizedBox(height: 10) : Container(),
      ],
    );
  }

  Widget search({
    Widget icon = const SizedBox(),
    String hintText = 'Search By ID...',
  }) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SvgPicture.asset(
            'assets/images/search-black.svg',
            width: 20,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            if (controller.activeTab.value == 'barcode') {
              Get.to(const ScanQrCodeScreen());
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: controller.activeTab.value == 'hand' ? const SizedBox() : icon,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0XFFbecada),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0XFFbecada),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0XFFbecada),
          ),
        ),
      ),
    );
  }

  Widget labSearch({bool result = true}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0XFFbecada),
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SvgPicture.asset(
                  'assets/images/search-black.svg',
                  width: 20,
                ),
              ),
              hintText: 'Lab',
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              // remove border
              border: InputBorder.none,
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: BorderSide(
              //     color: Color(0XFFbecada),
              //   ),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: BorderSide(
              //     color: Color(0XFFbecada),
              //   ),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: BorderSide(
              //     color: Color(0XFFbecada),
              //   ),
              // ),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.2),
          ),
          result
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      star(isLab: true, title: 'Lab01-F1'),
                      star(isLab: true, title: 'Lab01-F2'),
                      star(isLab: true, title: 'Lab01-F3'),
                      star(isLab: true, last: true, title: 'Lab01-F4'),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget tabs() {
    return Obx(
      () => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.changeActiveTab('nfc'),
              child: otherSingleBox(
                active: controller.activeTab.value == 'nfc',
                icon: 'assets/images/nfc.svg',
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: GestureDetector(
              onTap: () {
                controller.changeActiveTab('barcode');
                Get.to(const ScanQrCodeScreen());
              },
              child: otherSingleBox(
                active: controller.activeTab.value == 'barcode',
                icon: 'assets/images/barcode.svg',
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: GestureDetector(
              onTap: () => controller.changeActiveTab('hand'),
              child: otherSingleBox(
                active: controller.activeTab.value == 'hand',
                icon: 'assets/images/hand.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget otherSingleBox({bool active = false, required String icon}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: active ? ColorConstants.secondaryColor : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: active ? ColorConstants.secondaryColor : Colors.white,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF000000).withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            active
                ? 'assets/images/active_checkbox.svg'
                : 'assets/images/inactive_checkbox.svg',
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SvgPicture.asset(
              icon,
              width: 25,
              color: active ? ColorConstants.primaryColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget singleBox({String? title, String? icon, required bool isActive}) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: isActive ? ColorConstants.secondaryColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? ColorConstants.primaryColor : Colors.white,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF000000).withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          SizedBox(
            width: 170,
            height: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon!,
                  height: 6.h,
                ),
                const SizedBox(height: 10),
                Text(
                  title!.capitalizeFirst!,
                  style: TextStyle(
                    // fontFamily: FontFamily.arial,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: SvgPicture.asset(isActive
                ? 'assets/images/active_checkbox.svg'
                : 'assets/images/inactive_checkbox.svg'),
          ),
        ],
      ),
    );
  }

  Widget medicalTab() {
    return Obx(
      () => Column(
        children: [
          const SizedBox(height: 20),
          tabs(),
          const SizedBox(height: 30),
          search(
            icon: SvgPicture.asset(
              'assets/images/${controller.activeTab.value}.svg',
              width: 30,
              color: ColorConstants.primaryColor,
            ),
          ),
          const SizedBox(height: 30),
          fullStars(title: 'Support For', children: [
            // star(),
            // star(),
            // star(),
            star(last: true),
          ]),
          const SizedBox(height: 20),
          Column(
            children: [
              search(
                icon: SvgPicture.asset(
                  'assets/images/${controller.activeTab.value}.svg',
                  width: 30,
                  color: ColorConstants.primaryColor,
                ),
                hintText: 'Select Location (LAB H2)',
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: mainBtn(
                    text: 'notify',
                    radius: 19,
                      onTap: ()=>Get.dialog(const SuccessDialog(message: 'Notified Successfully'))
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }

  Widget otherTab() {
    return Obx(
      () => Column(
        children: [
          const SizedBox(height: 20),
          tabs(),
          const SizedBox(height: 30),
          textArea(),
          const SizedBox(height: 20),
          search(
            icon: controller.activeTab.value == 'nfc' ||
                    controller.activeTab.value == 'barcode'
                ? SvgPicture.asset(
                    'assets/images/${controller.activeTab.value}.svg',
                    width: 30,
                    color: ColorConstants.primaryColor,
                  )
                : const SizedBox(),
          ),
          // const SizedBox(height: 30),
          fullStars(title: '', children: [
            // star(),
            // star(),
            // star(),
            star(last: true),
          ]),
          const SizedBox(height: 20),
          Column(
            children: [
              search(
                hintText: controller.activeTab.value == 'barcode'
                    ? 'Search By ID...'
                    : 'Select Location (LAB H2)',
                icon: controller.activeTab.value == 'nfc' ||
                        controller.activeTab.value == 'barcode'
                    ? SvgPicture.asset(
                        'assets/images/${controller.activeTab.value}.svg',
                        width: 30,
                        color: ColorConstants.primaryColor,
                      )
                    : const SizedBox(),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: mainBtn(
                    text: 'notify',
                    radius: 19,
                      onTap: ()=>Get.dialog(const SuccessDialog(message: 'Notified Successfully'))
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }

  Widget textArea() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Add Comment',
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0XFFbecada),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0XFFbecada),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0XFFbecada),
          ),
        ),
      ),
    );
  }

  openSelectStarsDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              // height: 300,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Select Stars',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    starSelectItems(),
                    const SizedBox(height: 20),
                    checkTile(isActive: true),
                    checkTile(),
                    checkTile(isActive: true),
                    checkTile(),
                    checkTile(isActive: true),
                    checkTile(),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 130,
                      child: mainBtn(
                        text: 'continue',
                        radius: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  openMedicalSupportDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              // height: 300,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Medical Support',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    medicalSelectItems(),
                    const SizedBox(height: 20),
                    checkTile(isActive: true),
                    checkTile(),
                    checkTile(isActive: true),
                    checkTile(),
                    checkTile(isActive: true),
                    checkTile(),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 130,
                      child: mainBtn(
                        text: 'continue',
                        radius: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container checkTile({bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: isActive ? ColorConstants.secondaryColor : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0XFFC9C9C9),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 1.07,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorConstants.primaryColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/student.svg',
                          height: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Sania',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '#632541',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            isActive
                ? 'assets/images/active_checkbox.svg'
                : 'assets/images/inactive_checkbox.svg',
            height: 45,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget starSelectItems() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: const Color(0XFFCECECE),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                Expanded(
                  child: dropDownBuilder(
                    prefixIcon: 'assets/images/select-star-prefix.svg',
                    hint: ' Grade 3',
                    items: controller.starGradeValue,
                    onChanged: (value) {
                      controller.selectedStarGrade = value;
                    },
                  ),
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: const Color(0XFFC4C4C4),
                ),
                Expanded(
                  child: dropDownBuilder(
                    prefixIcon: 'assets/images/select-star-prefix.svg',
                    hint: 'H1',
                    items: controller.startOtherValue,
                    onChanged: (value) {
                      controller.selectedStarOther = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 1,
            color: const Color(0XFFC4C4C4),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search Star,ID...',
              hintStyle: const TextStyle(
                color: Color(0XFFB0B0B0),
                fontSize: 16,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8, right: 20),
                child: SvgPicture.asset(
                  'assets/images/search-black.svg',
                  height: 18,
                  width: 18,
                  fit: BoxFit.scaleDown,
                ),
              ),
              border: InputBorder.none,
              prefixIconConstraints: const BoxConstraints(
                  minHeight: 14, minWidth: 22, maxHeight: 30, maxWidth: 2302),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget medicalSelectItems() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: const Color(0XFFCECECE),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          dropDownBuilder(
            prefixIcon: 'assets/images/select-star-prefix.svg',
            hint: 'Select Role',
            items: controller.medicalRoleValue,
            onChanged: (value) {
              controller.selectedMedicalRole = value;
            },
          ),
          Container(
            width: Get.width,
            height: 1,
            color: const Color(0XFFC4C4C4),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search By ID...',
              hintStyle: const TextStyle(
                color: Color(0XFFB0B0B0),
                fontSize: 16,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8, right: 20),
                child: SvgPicture.asset(
                  'assets/images/search-black.svg',
                  height: 18,
                  width: 18,
                  fit: BoxFit.scaleDown,
                ),
              ),
              border: InputBorder.none,
              prefixIconConstraints: const BoxConstraints(
                minHeight: 14,
                minWidth: 22,
                maxHeight: 30,
                maxWidth: 22,
              ),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }

  DropdownButtonFormField<String> dropDownBuilder(
      {required String prefixIcon,
      required String hint,
      required List<String> items,
      Function(String?)? onChanged}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(
            prefixIcon,
            height: 18,
            width: 18,
            fit: BoxFit.scaleDown,
          ),
        ),
        border: InputBorder.none,
        prefixIconConstraints: const BoxConstraints(
            minHeight: 14, minWidth: 22, maxHeight: 22, maxWidth: 22),
        isDense: true,
      ),
      isExpanded: true,
      hint: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          hint,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
