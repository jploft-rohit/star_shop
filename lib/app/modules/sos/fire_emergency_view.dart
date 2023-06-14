import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/app/routes/app_routes.dart';

import '../../../common/app_header.dart';
import '../../../common/main_btn.dart';
import '../../controller/sos/fire_emergency_controller.dart';


class FireEmergencyView extends GetView<FireEmergencyController> {
  const FireEmergencyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'SOS',
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 550,
                      decoration: BoxDecoration(
                        color: const Color(0XFFE62626),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/fire-alarm.svg',
                              height: 90,
                              width: 90,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Fire Emergency',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Fire Reported at LAB02-F1 Please report to assembly point for evacuation.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: mainBtn(
                                text: 'reached',
                                radius: 19,
                                onTap: () {
                                  Get.toNamed(Routes.sosAssembly);
                                },
                                fontSize: 17.sp,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: mainBtn(
                                text: 'help me',
                                radius: 19,
                                onTap: () {
                                  Get.toNamed(Routes.askForHelp);
                                },
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Reported by: Ahmed (Teacher)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
}
