import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function()? onPressed;

  const CustomElevatedButton({
    required this.color,
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        padding: const EdgeInsets.all(kIsWeb?15:8),
        disabledBackgroundColor: AppStyle.kGreyColor,
        animationDuration: const Duration(milliseconds: 250),
        minimumSize: Size(double.infinity, getHeight * 0.045),
        maximumSize: Size(double.infinity, kIsWeb?getHeight * 0.2:getHeight * 0.1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontFamily: AppStyle.fontName ,
            fontWeight: AppFontWeight.bold
        ),
      ),
    );
  }
}
