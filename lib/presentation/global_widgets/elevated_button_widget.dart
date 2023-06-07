import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';




class ElevatedButtonWidget extends StatelessWidget {

  ElevatedButtonWidget(
      {this.color = AppStyle.darkBlueColor,
      this.fontFamily = "Cairo",
      this.fontSize = 18,
      this.title = '',
      this.onPressed,
      Key? key,
      })
      : super(key: key);

  Function()? onPressed;
  String title;
  int fontSize;
  String fontFamily;
  Color? color;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    // SizeConfig().init(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // side: BorderSide(
        //   color: border ? kGreenColor : Colors.transparent,
        // ),
        backgroundColor: color,
        foregroundColor: const Color(0xff232323) ,
        elevation: 0,
        disabledBackgroundColor: AppStyle.kGreyColor,
        animationDuration: const Duration(milliseconds: 250),
        minimumSize: Size(double.infinity, getHeight * 0.045),
        maximumSize: Size(double.infinity, getHeight * 0.1),
        // shape: const RoundedRectangleBorder(
        //   borderRadius: kButtonRadius, // <-- Radius
        // ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: fontFamily,
          height: 1.5,
          color: AppStyle.kBackGroundColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
