import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/color_constants.dart';

class BaseStarHorizontalFilter extends StatefulWidget {
  final double? topMargin,bottomMargin,rightMargin,leftMargin;
  const BaseStarHorizontalFilter({super.key, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin});

  @override
  State<BaseStarHorizontalFilter> createState() => _BaseStarHorizontalFilterState();
}

class _BaseStarHorizontalFilterState extends State<BaseStarHorizontalFilter> {

  List<bool> isChecked = List.generate(20, (index) => false);
  @override
  void initState() {
    super.initState();
    isChecked[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.topMargin??0,bottom: widget.bottomMargin??2.h,right: widget.rightMargin??0,left: widget.leftMargin??0),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: 20,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              setState(() {
                if (index != 0) {
                  isChecked[index] = !isChecked[index];
                  isChecked[0] = false;
                }else{
                  isChecked = isChecked.map<bool>((v) => false).toList();
                  isChecked[0] = true;
                }
              });
            },
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(right: 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorConstants.primaryColor),
                color: isChecked[index] ? ColorConstants.primaryColor : Colors.white
              ),
              child: index == 0
                  ? Text("All",style: TextStyle(
                color: isChecked[index]
                    ? Colors.white
                    : ColorConstants.primaryColor,
                  ),
                  )
                  : SvgPicture.asset(
                  index.isEven
                      ? "assets/icon/ic_student_female.svg"
                      : "assets/icon/ic_student_male.svg",
                  color: isChecked[index]
                      ? Colors.white
                      : ColorConstants.primaryColor,
              ),
             ),
          );
         },
        ),
      ),
    );
  }
}
