import 'package:flutter/material.dart';
import '../../../utility/app_style.dart';
import '../../global_widgets/shimmer.dart';

class MyPropertiesShimmer extends StatelessWidget {
  MyPropertiesShimmer({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: (index % 2 == 1)
            ? AppStyle.kBackGroundColor
            : AppStyle.kLightGrey,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.02,
            bottom: screenHeight * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.35,
              height: screenHeight * 0.12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ShimmerLoader(),
            ),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight*0.03,),
                  ShimmerLoader(height: screenHeight*0.04,width: screenWidth*0.4,),
                  SizedBox(height: screenHeight*0.01,),
                  ShimmerLoader(height: screenHeight*0.04,width: screenWidth*0.2,),
                  SizedBox(height: screenHeight*0.01,),
                  ShimmerLoader(height: screenHeight*0.04,width: screenWidth*0.2,),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight*0.03,),
               ShimmerLoader(height:30,border: BorderRadius.circular(50),width: 30,),
                SizedBox(height: screenHeight*0.01,),
                ShimmerLoader(height:30,border: BorderRadius.circular(50),width: 30,),
                SizedBox(height: screenHeight*0.01,),
                ShimmerLoader(height:30,border: BorderRadius.circular(50),width: 30,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
