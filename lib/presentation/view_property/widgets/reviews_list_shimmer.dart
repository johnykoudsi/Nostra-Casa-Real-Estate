import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/global_widgets/shimmer.dart';

import '../../../utility/app_style.dart';

class ReviewsListShimmer extends StatelessWidget {
  const ReviewsListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding:
      EdgeInsets.only(left: screenWidth * 0.03, right: screenWidth * 0.03),
      child: Container(
        height: screenHeight * 0.2,
        width: screenWidth * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppStyle.kGreyColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: screenHeight*0.02,),
                    ShimmerLoader(width: screenWidth*0.1,height: screenHeight*0.03,),
                    SizedBox(height: screenHeight*0.01,),
                    ShimmerLoader(width: screenWidth*0.05,height: screenHeight*0.03,),
                  ],
                ),
              ),
              ShimmerLoader(width: screenWidth*0.4,height: screenHeight*0.02),
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  ShimmerLoader(width: screenWidth*0.2,height: screenHeight*0.02,),
                  SizedBox(height: screenHeight*0.01,),
                  ShimmerLoader(width: screenWidth*0.2,height: screenHeight*0.01,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
