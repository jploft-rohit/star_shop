import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/color_constants.dart';


Widget tab(List<Widget> tabButtons) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: tabButtons,
  );
}

Widget tabButton({
  required String title,
  required Function() onTap,
  required bool isSelected,
  double? fontSize,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSelected ? ColorConstants.secondaryColor : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.transparent : const Color(0XFF7b8d9b),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          isSelected
              ? BoxShadow(
                  color: ColorConstants.gretTextColor.withOpacity(0.5),
                  offset: const Offset(0, 4),
                  blurRadius: 2,
                  spreadRadius: 0,
                )
              : const BoxShadow(
                  color: Colors.transparent,
                ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? ColorConstants.primaryColor : const Color(0XFF7b8d9b),
            fontSize: fontSize ?? 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
