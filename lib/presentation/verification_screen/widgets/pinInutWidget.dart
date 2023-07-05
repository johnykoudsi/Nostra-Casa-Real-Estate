
import 'package:nostra_casa/utility/app_style.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';

class PinPutTheme{
  static const defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontWeight: AppFontWeight.bold,fontSize: 25),
    decoration: BoxDecoration(),
  );

  static final cursor = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 56,
        height: 3,
        decoration: BoxDecoration(
          color: AppStyle.blackColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
  static final preFilledWidget = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 56,
        height: 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
}
