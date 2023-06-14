import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app_header.dart';
import 'color_constants.dart';
import 'utils.dart';



class DirectionView extends StatefulWidget {
  const DirectionView({Key? key}) : super(key: key);

  @override
  State<DirectionView> createState() => _DirectionViewState();
}

class _DirectionViewState extends State<DirectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(5.h), child:  AppHeader(showBackIcon: true, title: 'Route',)),
      body: Container(
        margin: const  EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: getCurvedBorderRadius(),
                child : Container(
                    decoration: BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        border: Border.all(color: ColorConstants.borderColor2,width: 2),
                        boxShadow: [getBoxShadow()]
                    ),
                    child: Image.asset('assets/images/map.png'))
            )
          ],
        ),
      ),
    );
  }
}
