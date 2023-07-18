import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget({
    this.mainColor = AppStyle.mainColor,
    this.gradientColor = AppStyle.seconderyColor,
    this.fontSize = 18,
    this.title = '',
    this.onPressed,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  Function()? onPressed;
  String title;
  int fontSize;
  Color mainColor;
  Color gradientColor;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    return Builder(builder: (context) {
      if (isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Container(
        height: getHeight * 0.045,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.85, -0.53),
            end: const Alignment(-0.85, 0.53),
            colors: [gradientColor, mainColor],
          ),
          borderRadius: AppStyle.k8BorderRadius,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: const Color(0xff232323),
            elevation: 0,
            disabledBackgroundColor: AppStyle.kGreyColor,
            animationDuration: const Duration(milliseconds: 250),
            minimumSize: Size(double.infinity, getHeight * 0.045),
            maximumSize: Size(double.infinity, getHeight * 0.1),
            shape: const RoundedRectangleBorder(
              borderRadius: AppStyle.k8BorderRadius, // <-- Radius
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(
              height: 1,
              color: AppStyle.kBackGroundColor,
              fontWeight: AppFontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      );
    });
  }
}
