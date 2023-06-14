import 'package:flutter/material.dart';

import 'color_constants.dart';


Widget mainBtn({
  String text = 'continue',
  void Function()? onTap,
  isDisabled = false,
  double fontSize = 15,
  double radius = 19,
  Color backgroundColor = const Color(0xFFF8F4E9),
  FontWeight fontWeight = FontWeight.w600,
  bool isShadow = true,
  bool autoCapitalize = true,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 180,
      height: 40,
      decoration: BoxDecoration(
        color: isDisabled ? Colors.white : backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
            color: isDisabled ? const Color(0XFFBECADA) : ColorConstants.primaryColor,
            width: 1),
        boxShadow: [
          !isDisabled && isShadow
              ? BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1.0,
                  blurRadius: 2.0,
                  offset: const Offset(0, 3))
              : const BoxShadow(),
        ],
      ),
      child: Center(
        child: Text(
          autoCapitalize ? text.toUpperCase() : text,
          style: TextStyle(
            color: isDisabled ? const Color(0XFF7B8D9E) : ColorConstants.primaryColor,
            fontSize: fontSize,
            fontWeight: isDisabled ? FontWeight.normal : fontWeight,
          ),
        ),
      ),
    ),
  );
}
