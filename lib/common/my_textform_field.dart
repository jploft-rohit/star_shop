import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:star_shop/common/utils.dart';
import 'package:star_shop/common/validator.dart';

import 'color_constants.dart';


class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String titleText, hintText, errorMsg, lableText,icon;
  final bool obsecureText,
      readOnly,
      isEmail,
      isPhone,
      isRequired,
      isUrl,
      isFocus,isIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Widget suffix;
  final int maxLines;
  final Color color;
  final Function()? onPressed;
  final double borderRadius;

  const MyTextFormField(
      {Key? key,
      required this.controller,
      required this.titleText,
      this.obsecureText = false,
      this.readOnly = false,
      this.isEmail = false,
      this.isUrl = false,
      this.isPhone = false,
      this.isRequired = true,
      this.hintText = "",
      this.lableText = "",
      this.errorMsg = "This field is required.",
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.suffix = const SizedBox(),
      this.color = const Color(0xFFFCFCFC),
      this.maxLines = 1,
      this.borderRadius = 5,
      this.isFocus = true,
      this.isIcon = false,
      this.icon = "",
      this.onPressed})
      : super(key: key);

  @override
  Padding build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titleText != ""
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: addText(
                          titleText, 15,Colors.black,  FontWeight.w700),
                      width: MediaQuery.of(context).size.width * 0.20,
                    ),
                  SizedBox(width: 1.h,),
                  isIcon?SvgPicture.asset(icon):const SizedBox.shrink()
                ],
              )
              : const SizedBox.shrink(),
          Expanded(
            child: TextFormField(
              obscureText: obsecureText,
              controller: controller,
              onTap: onPressed ?? () {},
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                isDense: true,
                hintText: hintText,
                labelText: lableText,
                fillColor: color,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Color(0xFFBECADA)),
                    borderRadius: getCustomBorderRadius(borderRadius)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Color(0xFFBECADA)),
                    borderRadius: getCustomBorderRadius(borderRadius)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Color(0xFFBECADA)),
                    borderRadius: getCustomBorderRadius(borderRadius)),
                suffixIcon: suffix,
                suffixIconConstraints: const BoxConstraints(
                  minHeight: 25,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: Theme.of(context)
                    .inputDecorationTheme
                    .hintStyle
                    ?.copyWith(fontSize: 15.sp, color: const Color(0xFF000000)),
                hintStyle: Theme.of(context)
                    .inputDecorationTheme
                    .hintStyle
                    ?.copyWith(fontSize: 15.sp, color: const Color(0xFF000000)),
              ),
              readOnly: readOnly,
              maxLines: maxLines,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(fontSize: 15.sp, color: const Color(0xFF000000)),
              keyboardType: textInputType,
              textInputAction: textInputAction,
              validator: (val) {
                if (!isRequired) return null;
                if (val!.isEmpty) return errorMsg;
                if (isEmail) {
                  if (!Validator.validatorInstanace.isValidEmail(val)) {
                    return "Please enter a valid email.";
                  }
                }
                if (isPhone) {
                  if (!Validator.validatorInstanace.isValidPhone(val)) {
                    return "Please enter a valid phone number.";
                  }
                }
                if (isUrl) {
                  String patttern =
                      r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?";
                  RegExp regExp = new RegExp(patttern);
                  if (!regExp.hasMatch(val)) {
                    return 'Please enter valid URL';
                  }
                }
                return null;
              },
              onSaved: (val) => controller.text = val!,
            ),
          ),
        ],
      ),
    );
  }
}

class MyDropDownButtonFormField extends StatelessWidget {
  final String title, hint, errorMsg;
  final List<DropDownButtonsModel> dropDown;
  final TextEditingController controller;
  final bool isEnbale;
  final double topPadding, bottomPadding;

  const MyDropDownButtonFormField({
    Key? key,
    required this.dropDown,
    required this.title,
    required this.controller,
    required this.hint,
    this.errorMsg = "This field is required.",
    this.isEnbale = true,
    this.topPadding = 15,
    this.bottomPadding = 20,
  }) : super(key: key);

  @override
  Padding build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title != ""
              ? Container(
                  child: addText(title,  15,Colors.black, FontWeight.w700),
                  width: MediaQuery.of(context).size.width * 0.20,
                )
              : const SizedBox.shrink(),
          title != ""
              ? const SizedBox(
                  width: 5,
                )
              : const SizedBox.shrink(),
          Expanded(
            child: DropdownButtonFormField<String>(
              borderRadius: BorderRadius.circular(15),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFBECADA))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFBECADA))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFBECADA))),
                isDense: true,
                contentPadding:
                    EdgeInsets.only(bottom: 10, top: 10, left: 15, right: 8),
                suffixIconConstraints: BoxConstraints(
                  minHeight: 25,
                ),
                fillColor: Color(0xFFFCFCFC),
                filled: true,
              ),
              hint: Text(
                hint,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(fontSize: 15.sp, color: const Color(0xFF000000)),
              ),
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(fontSize: 15.sp, color: const Color(0xFF000000)),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0XFF000000),
              ),
              items: dropDown
                  .map(
                      (e) => DropdownMenuItem(child: Text(e.name), value: e.id))
                  .toList(),
              onChanged: isEnbale ? (val) => controller.text = val! : null,
              validator: (val) {
                if (controller.text.isEmpty) return errorMsg;
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownButtonsModel {
  final String id, name;
  DropDownButtonsModel(this.id, this.name);
}

class UnderlineTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText, errorMsg, lableText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool readOnly, isRequired;
  final String? Function(String? val) func;

  const UnderlineTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.lableText,
    this.readOnly = false,
    this.isRequired = true,
    this.errorMsg = "This field is required.",
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    required this.func,
  }) : super(key: key);

  @override
  Padding build(BuildContext context) {
    const underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0XFFB1B7C3), width: 1),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          hintText: hintText,
          prefix: Icon(
            CupertinoIcons.location_solid,
            size: 14,
            color: ColorConstants.primaryColor,
          ),
          hintStyle: TextStyle(
            color: const Color(0XFF345251),
            fontSize: 15.sp,
          ),
          fillColor: const Color(0xFFFCFCFC),
          filled: true,
          labelText: lableText,
          labelStyle: TextStyle(
            color: const Color(0XFF345251),
            fontSize: 15.sp,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: underlineInputBorder,
          enabledBorder: underlineInputBorder,
          focusedBorder: underlineInputBorder,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
        ),
        style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 15.sp),
        keyboardType: textInputType,
        textInputAction: textInputAction,
        onChanged: func,
        validator: (val) {
          if (isRequired && val!.isEmpty) return errorMsg;
          return null;
        },
        onSaved: (val) => controller.text = val!,
      ),
    );
  }
}

class MyTextFormFieldwithradius extends StatelessWidget {
  final TextEditingController controller;
  final String titleText, hintText, errorMsg, lableText;
  final bool obsecureText,
      readOnly,
      isEmail,
      isPhone,
      isRequired,
      isUrl,
      isFocus;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Widget suffix;
  final int maxLines;
  final double topPadding, bottomPadding;
  final Color color;

  const MyTextFormFieldwithradius(
      {Key? key,
      required this.controller,
      required this.titleText,
      this.obsecureText = false,
      this.readOnly = false,
      this.isEmail = false,
      this.isUrl = false,
      this.isPhone = false,
      this.isRequired = true,
      this.hintText = "",
      this.lableText = "",
      this.errorMsg = "This field is required.",
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.suffix = const SizedBox(),
      this.color = const Color(0xFFFCFCFC),
      this.maxLines = 1,
      this.topPadding = 15,
      this.bottomPadding = 20,
      this.isFocus = true})
      : super(key: key);

  @override
  Padding build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titleText != ""
              ? Container(
                  child: addText(
                      titleText,14, Colors.black,  FontWeight.w700),
                  width: MediaQuery.of(context).size.width * 0.18,
                )
              : const SizedBox.shrink(),
          titleText != ""
              ? const SizedBox(
                  width: 5,
                )
              : const SizedBox.shrink(),
          Expanded(
            child: TextFormField(
              obscureText: obsecureText,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                isDense: true,
                hintText: hintText,
                labelText: lableText,
                fillColor: color,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFFBECADA),
                    ),
                    borderRadius: getBorderRadius()),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Color(0xFFBECADA)),
                    borderRadius: getBorderRadius()),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Color(0xFFBECADA)),
                    borderRadius: getBorderRadius()),
                suffixIcon: suffix,
                suffixIconConstraints: const BoxConstraints(
                  minHeight: 25,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: Theme.of(context)
                    .inputDecorationTheme
                    .hintStyle
                    ?.copyWith(fontSize: 15.sp),
                hintStyle: Theme.of(context)
                    .inputDecorationTheme
                    .hintStyle
                    ?.copyWith(fontSize: 15.sp),
              ),
              readOnly: readOnly,
              maxLines: maxLines,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(fontSize: 15.sp),
              keyboardType: textInputType,
              textInputAction: textInputAction,
              validator: (val) {
                if (!isRequired) return null;
                if (val!.isEmpty) return errorMsg;
                if (isEmail) {
                  if (!Validator.validatorInstanace.isValidEmail(val)) {
                    return "Please enter a valid email.";
                  }
                }
                if (isPhone) {
                  if (!Validator.validatorInstanace.isValidPhone(val)) {
                    return "Please enter a valid phone number.";
                  }
                }
                if (isUrl) {
                  String patttern =
                      r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?";
                  RegExp regExp = new RegExp(patttern);
                  if (!regExp.hasMatch(val)) {
                    return 'Please enter valid URL';
                  }
                }
                return null;
              },
              onSaved: (val) => controller.text = val!,
            ),
          ),
        ],
      ),
    );
  }
}

class MyDatePickerTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String titleText, hintText, errorMsg;
  final bool readOnly, isRequired;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Widget suffix;
  final Function(DateTime date) func;
  final double topPadding, bottomPadding;

  const MyDatePickerTextFormField({
    Key? key,
    required this.controller,
    required this.titleText,
    required this.func,
    this.readOnly = false,
    this.isRequired = true,
    this.hintText = "",
    this.errorMsg = "This field is required.",
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.suffix = const SizedBox.shrink(),
    this.topPadding = 15,
    this.bottomPadding = 20,
  }) : super(key: key);

  @override
  Column build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText == ""
            ? const SizedBox.shrink()
            : Text(
                titleText,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 15.sp),
              ),
        Padding(
          padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
          child: TextFormField(
            onTap: readOnly
                ? () {}
                : () async {
                    final date = await showDatePicker(
                        context: context,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: ColorConstants.primaryColor,
                              ),
                            ),
                            child: child!,
                          );
                        },
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1600, 8),
                        lastDate: DateTime.now());
                    if (date != null) func(date);
                    // controller.text = DateFormat('dd MMM, yyyy').format(date);

                    ;
                  },
            readOnly: true,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              hintStyle: Theme.of(context)
                  .inputDecorationTheme
                  .hintStyle
                  ?.copyWith(fontSize: 15.sp, color: Colors.black),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFBECADA)),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFBECADA))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFF000000))),
            ),
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(fontSize: 15.sp, color: Colors.black),
            keyboardType: textInputType,
            textInputAction: textInputAction,
            validator: (val) {
              if (!isRequired) return null;
              if (val!.isEmpty) return errorMsg;
              return null;
            },
            onSaved: (val) => controller.text = val!,
          ),
        ),
      ],
    );
  }
}

class MyDatePickerTextFormFieldcustom extends StatelessWidget {
  final TextEditingController controller;
  final String titleText, hintText, errorMsg;
  final bool readOnly, isRequired;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Widget suffix;
  final Function(DateTime date) func;
  final double topPadding, bottomPadding, maxHeight;

  const MyDatePickerTextFormFieldcustom(
      {Key? key,
      required this.controller,
      required this.titleText,
      required this.func,
      this.readOnly = false,
      this.isRequired = true,
      this.hintText = "",
      this.errorMsg = "This field is required.",
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.suffix = const SizedBox.shrink(),
      this.topPadding = 15,
      this.bottomPadding = 20,
      this.maxHeight = 50})
      : super(key: key);

  @override
  Column build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText == ""
            ? const SizedBox.shrink()
            : Text(
                titleText,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 15.sp),
              ),
        Padding(
          padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
          child: TextFormField(
            onTap: readOnly
                ? () {}
                : () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                    );
                    if (date != null) func(date);
                  },
            readOnly: true,
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hintText,
              constraints: BoxConstraints(maxHeight: maxHeight),
              hintStyle: Theme.of(context)
                  .inputDecorationTheme
                  .hintStyle
                  ?.copyWith(fontSize: 15.sp),
            ),
            style:
                Theme.of(context).textTheme.caption?.copyWith(fontSize: 15.sp),
            keyboardType: textInputType,
            textInputAction: textInputAction,
            validator: (val) {
              if (!isRequired) return null;
              if (val!.isEmpty) return errorMsg;
              return null;
            },
            onSaved: (val) => controller.text = val!,
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  bool? obscureText;
  String hintText;
  Color? fillColor;
  Color? txtColor;
  TextInputAction? textInputAction;
  List<TextInputFormatter>? textInputFormatter;
  TextInputType? textInputType;
  String? errorText;
  int? maxLine;
  EdgeInsetsGeometry? contentPadding;
  Widget? suffixIcon;
  double? borderRadius;
  Color? borderColor;
  Function()? onTap;
  Widget? prefixIcon;
  bool? readOnly;
  double? hintTxtSize;

  Color? hintTextColor;

  CustomTextField(
      {Key? key,
      required this.controller,
      this.obscureText,
      required this.hintText,
      this.textInputAction,
      this.textInputType,
      this.textInputFormatter,
      this.suffixIcon,
      this.prefixIcon,
      this.errorText,
      this.borderRadius,
      this.fillColor,
      this.txtColor,
      this.borderColor,
      this.maxLine,
      this.contentPadding,
      this.hintTxtSize,
      this.onTap,
      this.readOnly,
      this.hintTextColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
      maxLines: maxLine,
      onTap: onTap,
      readOnly: readOnly ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      style: TextStyle(color: txtColor ?? Colors.black, fontSize: 15.sp),
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 10.0, right: 10.0),
        isDense: true,
        hintMaxLines: 2,
        border: new OutlineInputBorder(
            borderSide:
                new BorderSide(color: ColorConstants.txtFiledBorderColor)),
        hintText: hintText,
        errorText: errorText,
        suffixIconConstraints: const BoxConstraints(maxHeight: 45),
        prefixIconConstraints: const BoxConstraints(maxHeight: 45),
        hintStyle: TextStyle(
            color: hintTextColor ?? Colors.black,
            fontSize: hintTxtSize ?? 15.sp),
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? Colors.transparent,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor ?? ColorConstants.txtFiledBorderColor,
              width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide.none,
          borderSide: BorderSide(
              color: borderColor ?? ColorConstants.txtFiledBorderColor,
              width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        errorBorder: OutlineInputBorder(
          // borderSide: BorderSide.none,
          // borderSide: BorderSide(color: ColorConstants.txtFiledErrorBorderColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor ?? ColorConstants.txtFiledBorderColor,
              width: 1.0),
          // borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
      ),
    );
  }
}
