import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_constants.dart';
import '../../../../controller/wallet_controller.dart';


class Event extends GetView<WalletController>{
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
    );
  }

}