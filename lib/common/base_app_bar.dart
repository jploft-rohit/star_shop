import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/routes/app_routes.dart';
import 'package:star_shop/common/utils.dart';

import 'color_constants.dart';



class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? showSos;
  final bool? showNotification;
  final bool? showBackIcon;
  final Function()? onDrawerPressed;
  final Function()? onBackPressed;

  const BaseAppBar({Key? key, this.title, this.showSos = false, this.onBackPressed, this.showNotification = true, this.showBackIcon = true, this.onDrawerPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:addText(title ?? "", getHeadingTextFontSIze(),
          ColorConstants.black, FontWeight.w700),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: onDrawerPressed != null
      ///   Drawer Icon
          ? GestureDetector(onTap: onDrawerPressed,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset("assets/images/ic_menu.svg"),
          ))
      ///   Back Icon
          : Visibility(
              visible: showBackIcon??true,
              child: GestureDetector(onTap: onBackPressed ?? (){
                 Navigator.pop(context);
              },child: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black,size: 20.sp)),
      ),
      actions: [
      ///  SOS Icon
        Visibility(
          visible: showSos??false,
          child: InkWell(
            onTap: (){
              Get.toNamed(Routes.sos);
            },
            child: SvgPicture.asset("assets/images/ic_sos.svg"),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
      /// Notification Icon
        Visibility(
          visible: showNotification??true,
          child: Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                  onTap: (){
                    Get.toNamed(Routes.notificationView);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: SvgPicture.asset("assets/images/notification.svg",height: 24.sp,width: 24.sp),
                  ),
              ),
              /// Notification Count
              Positioned(
                top: 1.8.h,
                child: Container(
                  height: 17.sp,
                  width: 17.sp,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstants.primaryColor
                  ),
                  child: Text("1",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}