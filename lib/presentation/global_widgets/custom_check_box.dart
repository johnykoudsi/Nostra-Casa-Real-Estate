import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';


class CustomCheckbox extends StatelessWidget {
  final double? size;
  final double? iconSize;
  late  bool? isSelected;
  final Function() onTap;
  final Color color;


  CustomCheckbox({ this.size, this.iconSize,this.isSelected=false ,  required this.onTap,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            color: isSelected! ? AppStyle.darkBlueColor : Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            border: isSelected! ? null : Border.all(
              color: color,
              width: 1.5,
            )
        ),
        width: size,
        height: size,

        child: isSelected!  ? Icon(
          Icons.check,
          color: Colors.white,
          size: iconSize,
        ) :null,
      ),
    );
  }
}


