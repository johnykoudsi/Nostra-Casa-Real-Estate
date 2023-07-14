import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_assets.dart';

import '../../../utility/app_style.dart';

class WelcomeStep extends StatefulWidget {
  const WelcomeStep({Key? key}) : super(key: key);

  @override
  State<WelcomeStep> createState() => _WelcomeStepState();
}

class _WelcomeStepState extends State<WelcomeStep> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.15,
              ),
              const Image(
                image: AssetImage(AppAssets.internalHouse),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.15, right: screenWidth * 0.15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Step 1',
              style:
                  Theme.of(context).textTheme.headline4!.copyWith(fontSize: 16),
            ),
            Text('Tell us about your place',style: Theme.of(context).textTheme.headline3,),
            Text('In this step, we\'ll ask you which type of property you have. Then let us know the location.' ),
          ],
        ),
      ),
    );
  }
}
