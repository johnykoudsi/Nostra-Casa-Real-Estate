import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/progress_bar.dart';
import 'package:nostra_casa/presentation/global_widgets/elevated_button_widget.dart';

import '../../../utility/app_style.dart';
import 'dart:math' as math;

class AddPropertyBottomNavigator extends StatelessWidget {
  AddPropertyBottomNavigator(
      {Key? key,
      required this.stepNumber,
      required this.progress,
      this.onPressedNext,
      this.onPressedBack})
      : super(key: key);
  double progress;
  int stepNumber;
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

                child: MyProgressBar(progressValue: progress)
          ),
          Row(
            children: [
              Builder(builder: (context) {
                // if(stepNumber == 0){
                //   return const SizedBox();
                // }
                return Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.038),
                    child: ElevatedButtonWidget(
                      title: 'Back'.tr(),
                      onPressed: onPressedBack,
                    ),
                  ),
                );
              }),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.038),
                  child: ElevatedButtonWidget(
                    title: 'Next'.tr(),
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
