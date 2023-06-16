
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/modules/notifications/dialogs/order_cancelled.dart';
import 'package:star_shop/app/modules/notifications/dialogs/order_changed.dart';
import 'package:star_shop/app/modules/notifications/dialogs/order_received.dart';
import 'package:star_shop/app/modules/notifications/dialogs/payment_received.dart';
import 'package:star_shop/app/modules/notifications/dialogs/refund_request.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Notifications',
          )),
      body: SizedBox(
        width: 100.w,
        height: 100.w,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return buildNotificationItem(index);
          },
        ),
      ),
    );
  }

  Widget buildNotificationItem(int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Get.dialog(const OrderReceivedDialog());
        } else if (index == 1) {
          Get.dialog(const OrderChangedDialog());
        } else if (index == 2) {
          Get.dialog(const OrderCancelledDialog());
        } else if (index == 3) {
          Get.dialog(const RefundRequestDialog());
        } else if (index == 4) {
          Get.dialog(const PaymentReceivedDialog());
        }
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.primaryColor),
              borderRadius: getCurvedBorderRadius(),
            ),
            child: SvgPicture.asset(
              'assets/images/user.svg',
              height: 4.h,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addText('Ahmed', getNormalTextFontSIze(), ColorConstants.black,
                  FontWeight.w500),
              addText('Lorem Ipsum is simply dummy', getSmallTextFontSIze(),
                  ColorConstants.gretTextColor, FontWeight.normal),
            ],
          )),
          addText('7:30 pm  - 05/05/2022', getSmallestTextFontSIze(),
              ColorConstants.lightTextColor, FontWeight.w500),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
