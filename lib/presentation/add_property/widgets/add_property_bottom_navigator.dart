import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/progress_bar.dart';
import 'package:nostra_casa/presentation/global_widgets/elevated_button_widget.dart';

import '../../../utility/app_style.dart';

class AddPropertyBottomNavigator extends StatelessWidget {
   AddPropertyBottomNavigator({Key? key,required this.progress,this.onPressedNext,this.onPressedBack}) : super(key: key);
  double progress;
   Function()? onPressedNext;
   Function()? onPressedBack;


   @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: AppStyle.kBackGroundColor,
      height: screenHeight * 0.15,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.01,
              bottom: screenHeight * 0.04,
            ),
            child: MyProgressBar(progressValue: progress),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: ElevatedButtonWidget(
                    title: 'Back',
                    onPressed: onPressedBack,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: ElevatedButtonWidget(
                    title: 'Next',
                    onPressed: onPressedNext,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
