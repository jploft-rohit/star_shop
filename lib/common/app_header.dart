import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:star_shop/common/utils.dart';

import '../app/routes/app_routes.dart';
import 'color_constants.dart';

class AppHeader extends StatefulWidget {
  final bool showBackIcon;
  final String title;

  const AppHeader({Key? key, required this.showBackIcon,required this.title}) : super(key: key);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorConstants.white,
        title: addText(widget.title, getHeadingTextFontSIze(),
            ColorConstants.black, FontWeight.bold),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorConstants.black),
        leading: widget.showBackIcon
            ? Center(
              child: IconButton(
              icon:  Icon(Icons.arrow_back_ios, color: Colors.black,size: getLargeTextFontSIze() * 1,),
              onPressed: () => Navigator.of(context).pop(),
             ))
            : const SizedBox.shrink(),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.notificationView);
            },
            child: SvgPicture.asset('assets/images/notification.svg',
                height: getLargeTextFontSIze() * 1.2),
          ),
          const SizedBox(width: 15)
        ]);
  }
}
