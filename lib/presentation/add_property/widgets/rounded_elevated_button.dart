import 'package:flutter/material.dart';
import '../../../utility/app_style.dart';

// ignore: must_be_immutable
class RoundedElevatedButton extends StatelessWidget {
   RoundedElevatedButton({Key? key, required this.iconData,this.onTap,this.iconColor,this.backgroundColor})
      : super(key: key);
  final IconData iconData;
  Color? iconColor;
  Color? backgroundColor;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor == null ? AppStyle.kBackGroundColor: backgroundColor as Color,
        minimumSize: const Size(30, 30), // change the size here
        elevation: 0,
        shape:  const CircleBorder(
          side: BorderSide(
              color:  AppStyle.kGreyColor ,
              width: 1), // set the border color and width here
        ),
      ),
      child: Center(
        child: Icon(
          iconData,
          color: iconColor == null ? AppStyle.blackColor : iconColor as Color,
        ),
      ),
    );
  }
}
