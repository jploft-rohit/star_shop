import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/color_constants.dart';
import '../../routes/app_routes.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.selectLanguageView);
    });

    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Center(
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 30.w),
          child: SvgPicture.asset('assets/images/splash_image_1.svg',height: 30.w,width: 30.w,),
        ),
      ),
    );
  }
}
