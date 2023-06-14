import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';


class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool? flashOn = false;
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid && controller != null) {
      controller!.pauseCamera();
    } else if (Platform.isIOS && controller != null) {
      controller!.resumeCamera();
    }
  }

  _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.dispose();
        Get.log("object::${result!.code}");
      });
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(7.h),
            child: AppHeader(
              showBackIcon: true,
              title: 'QR Scanner',
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(

                  width: 230,
                  height: 230,
                  child: Stack(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: 223,
                            height: 223,
                            color: Colors.white,
                            child: Center(
                              child: QRView(
                                key: qrKey,
                                onQRViewCreated: (q) {},
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: SvgPicture.asset(
                            'assets/images/side-1.svg'),
                      ),
                      Positioned(
                        right: 0,
                        child: SvgPicture.asset(
                            'assets/images/side-2.svg'),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: SvgPicture.asset(
                            'assets/images/side-3.svg'),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: SvgPicture.asset(
                            'assets/images/side-4.svg'),
                      ),
                      Positioned.fill(
                        top: 0,
                        // left: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/images/sos_scan_success.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                decoration: getEditTextDecoration(),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(1.h),
                      width: 8.h,
                      height: 8.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorConstants.primaryColor),
                          borderRadius: getBorderRadius()
                      ), child: SvgPicture.asset('assets/images/student.svg',height: 6.h,),
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addText("Saniya", getNormalTextFontSIze(),
                            ColorConstants.black, FontWeight.w700),
                        addText("#455285", getNormalTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.w700),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/images/ic_delete.svg',
                      height: getLargeTextFontSIze(),
                    ),
                    SizedBox(
                      width: 1.4.h,
                    ),
                  ],
                ),
              )
              // SizedBox(height: 40.h,),
            ],
          ),
        ));
  }
}
