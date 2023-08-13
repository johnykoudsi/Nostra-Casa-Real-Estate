import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/global_widgets/shimmer.dart';
import 'package:nostra_casa/utility/app_style.dart';

class PropertyShimmer extends StatelessWidget {
  PropertyShimmer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.038,
          right: screenWidth * 0.038,
          bottom: screenWidth * 0.038,
          top: screenWidth * 0.038),
      child: SizedBox(
        width: screenWidth * 0.7,
        //height: screenHeight * 0.56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerLoader(
              height: screenWidth * 0.7,
              width: screenWidth,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerLoader(
                  width: 150,
                  height: 20,
                  border: AppStyle.k4RadiusLowerPadding,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03,
                      right: screenWidth * 0.03,
                      top: screenWidth * 0.01),
                  child: ShimmerLoader(
                    width: 40,
                    height: 25,
                    border: AppStyle.k4RadiusLowerPadding,

                  ),
                ),
              ],
            ),
            ShimmerLoader(
              width: 75,
              height: 25,
              border: AppStyle.k4RadiusLowerPadding,

            ),
            ShimmerLoader(
              width: 100,
              height: 25,
              border: AppStyle.k4RadiusLowerPadding,

            ),
          ],
        ),
      ),
    );
  }
}
