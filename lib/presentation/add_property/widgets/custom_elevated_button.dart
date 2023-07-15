import 'package:flutter/material.dart';

import '../../../utility/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
    CustomElevatedButton({Key? key,required this.onPress,required this.title,required this.iconData})
        : super(key: key);
    Function()? onPress;
    String title;
    IconData iconData;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: AppStyle.kBackGroundColor,
        borderRadius: AppStyle.k15BorderRadius,
        border: Border.all(
          color: AppStyle.kGreyColor,
        ),
      ),
      height: screenHeight*0.065,
      child: ElevatedButton(

        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppStyle.kBackGroundColor,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: AppStyle.k15BorderRadius, // <-- Radius
          ),
        ),
        child: Row(
          children: [
            Icon(iconData,size: 30,color: AppStyle.blackColor,),
            SizedBox(width: screenWidth*0.03,),
            Text(title,style: Theme.of(context).textTheme.headline5,),
          ],
        ),
      ),
    );
  }
}
