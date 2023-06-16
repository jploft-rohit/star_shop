import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/circular_bordered_button.dart';
import 'app_header.dart';
import 'color_constants.dart';


class PrintQrDialog extends StatefulWidget {
  const PrintQrDialog({Key? key}) : super(key: key);

  @override
  State<PrintQrDialog> createState() => _PrintQrDialogState();
}

class _PrintQrDialogState extends State<PrintQrDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(6.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Print QR',
          ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset('assets/images/qrcode.svg',width: 70.w)),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){},
                child: CircularBorderedButton(width: 40.w, text: 'PRINT QR'),
              ),
              SizedBox(width: 2.w),
              GestureDetector(
                onTap: (){},
                child: CircularBorderedButton(width: 40.w, text: 'Save QR'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
