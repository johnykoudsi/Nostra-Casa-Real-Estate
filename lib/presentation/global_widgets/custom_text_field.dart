import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nostra_casa/utility/app_style.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  IconData? icon;
  TextInputType? textInputType;
  int? fontSize;
  TextEditingController? controller;
  String? Function(String?)? validator;
  IconData? icon2;
  Function()? secureText;
  bool onlyNumber;
  bool passwordBool;
  Function(String)? onChanged;
  Function(String)? onSubmit;
  Function()? onTap;
  bool enabled;
  int? maxLength;
  TextInputAction action;
  int maxLines;
  String? initValue;
  String label;
  Color labelColor;

  CustomTextField(
      {this.labelColor = AppStyle.blackColor,
      this.label = "",
      this.initValue,
      this.action = TextInputAction.none,
      required this.hintText,
      this.onChanged,
      this.icon,
      this.textInputType,
      this.fontSize,
      this.controller,
      this.validator,
      this.icon2,
      this.secureText,
      required this.passwordBool,
      this.onlyNumber = false,
      this.onSubmit,
      this.onTap,
      this.enabled = true,
      this.maxLength,
      this.maxLines = 1});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              TextStyle(
                  fontSize: 18,
                  color: labelColor,
              ),
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          maxLines: maxLines,
          enabled: enabled,
          onFieldSubmitted: onSubmit,
          initialValue: initValue,
          onTap: onTap,
          onChanged: onChanged,
          style: const TextStyle(color: AppStyle.blackColor),
          inputFormatters: onlyNumber
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(maxLength),
                ]
              : <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(maxLength),
                ],
          validator: validator,
          controller: controller,
          obscureText: passwordBool,
          keyboardType: textInputType,
          cursorColor: AppStyle.blackColor,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xffbdbdbd),
                fontFamily: "",
                fontSize:18),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
                 borderRadius: AppStyle.k4RadiusLowerPadding,
                borderSide: BorderSide(
                  color: Colors.transparent,
                )),
            disabledBorder:  const OutlineInputBorder(
                borderRadius:  AppStyle.k4RadiusLowerPadding,
                borderSide: BorderSide(
                  color: Colors.transparent,
                )),
            enabled: true,
            focusedBorder: const OutlineInputBorder(
                borderRadius:  AppStyle.k4RadiusLowerPadding,
                borderSide: BorderSide(
                  width: 2,
                  color:  AppStyle.blackColor,
                )),
            border: const OutlineInputBorder(
                borderRadius:  AppStyle.k4RadiusLowerPadding,
                borderSide: BorderSide(
                  color: AppStyle.blackColor,
                )),
          ),
          textInputAction: action,
        ),
      ],
    );
  }
}
