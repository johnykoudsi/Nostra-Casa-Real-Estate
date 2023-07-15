import 'package:flutter/material.dart';
import '../../../utility/app_style.dart';

// ignore: must_be_immutable
class RoundedElevatedButton extends StatelessWidget {
   RoundedElevatedButton({Key? key, required this.iconData,this.onTap})
      : super(key: key);
  final IconData iconData;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppStyle.kBackGroundColor,
        minimumSize: const Size(30, 30), // change the size here
        elevation: 0,
        shape: const CircleBorder(
          side: BorderSide(
              color: AppStyle.kGreyColor,
              width: 1), // set the border color and width here
        ),
      ),
      child: Center(
        child: Icon(
          iconData,
          color: AppStyle.blackColor,
        ),
      ),
    );
  }
}
