
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/custom_switch.dart';
import '../../../common/utils.dart';
import '../../controller/notification_controller.dart';


class NotificationSettingsView extends GetView<NotificationController>{
  const NotificationSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
    preferredSize: Size.fromHeight(5.h),
    child: AppHeader(
    showBackIcon: true,
    title: 'Notification Settings',
    )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Order Received',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),
                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.wallets.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.wallets.value = !controller.wallets.value;
                  },))
              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Order Changed',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),
                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.performanceRating.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.performanceRating.value = !controller.performanceRating.value;
                  },))
              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Order Cancelled',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),

                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.changesOnTrips.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.changesOnTrips.value = !controller.changesOnTrips.value;
                  },))
              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Event Updates',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),
                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.eventUpdates.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.eventUpdates.value = !controller.eventUpdates.value;
                  },))
              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Performance Rating Received',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),

                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.starsChats.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.starsChats.value = !controller.starsChats.value;
                  },))
              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Refund Request Received',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),
                Obx(() => CustomSwitch(
                      key: GlobalKey(),
                      value: controller.parentChats.value,
                      enableColor: ColorConstants.primaryColorLight,
                      disableColor: ColorConstants.lightGreyColor,
                      width: 48,
                      height: 24,
                      switchHeight: 20,
                      switchWidth: 20,
                  onChanged: (bool value) {
                    controller.parentChats.value = !controller.parentChats.value;
                  },))


              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Payment Credit/Debits',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),


                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.adminChats.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.adminChats.value = !controller.adminChats.value;
                  },))

              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Wallet Credit/Debits',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),



                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.busDepartureTime.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.busDepartureTime.value = !controller.busDepartureTime.value;
                  },))


              ],
            ),




          ],
        ),
      ),
    );
  }

}