import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/color_constants.dart';
import 'package:star_shop/common/success_dialog.dart';

import '../../../common/app_header.dart';
import '../../../common/main_btn.dart';
import '../../controller/sos/ask_for_help_controller.dart';


class AskForHelpView extends GetView<AskForHelpController> {
  const AskForHelpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Ask for Help',
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    search(hintText: 'Select Location (LAB H2)'),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    tabs(),
                    const SizedBox(height: 20),
                    search(isTextArea: true, hintText: 'Add Comment'),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: mainBtn(
                          radius: 19,
                          text: 'notifiy',
                          onTap: () {
                            Get.dialog(const SuccessDialog(message: 'Notified Successfully'));
                          },
                          fontSize: 17.sp,
                        ),
                      ),
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

  Widget tabs() {
    return Obx(
      () => Column(
        children: [
          GestureDetector(
            onTap: () {
              controller.changeTab('I\'m stuck at my location');
            },
            child: tab(
                isActive:
                    controller.currentTab.value == 'I\'m stuck at my location',
                text: 'I\'m stuck at my location'),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              controller.changeTab('Medical Help');
            },
            child: tab(
              text: 'Medical Help',
              isActive: controller.currentTab.value == 'Medical Help',
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              controller.changeTab('Someone is stuck at report location');
            },
            child: tab(
              text: 'Someone is stuck at report location',
              isActive: controller.currentTab.value ==
                  'Someone is stuck at report location',
            ),
          ),
        ],
      ),
    );
  }

  Widget tab({bool isActive = false, required String text}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: ColorConstants.primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: ColorConstants.primaryColor,
                fontSize: 16.sp,
                // fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            isActive
                ? SvgPicture.asset(
                    'assets/images/active_checkbox.svg',
                    width: 40,
                  )
                : Container(
                    height: 40,
                  )
          ],
        ),
      ),
    );
  }

  Widget search({bool isTextArea = false, required String hintText}) {
    return TextField(
      maxLines: isTextArea ? 3 : 1,
      decoration: InputDecoration(
        prefixIcon: !isTextArea
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SvgPicture.asset(
                  'assets/images/search-black.svg',
                  width: 20,
                ),
              )
            : null,
        suffixIcon: !isTextArea
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SvgPicture.asset(
                  'assets/images/nfc.svg',
                  width: 25,
                ),
              )
            : null,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 12,
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
}
