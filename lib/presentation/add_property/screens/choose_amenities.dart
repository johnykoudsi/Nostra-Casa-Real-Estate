import 'package:flutter/material.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';
import '../widgets/custom_grid.dart';

class ChooseAmenities extends StatefulWidget {
  const ChooseAmenities({Key? key}) : super(key: key);

  @override
  State<ChooseAmenities> createState() => _ChooseAmenitiesState();
}

class _ChooseAmenitiesState extends State<ChooseAmenities> {
  @override
  Widget build(BuildContext context) {
    final List<String> svgPaths=[AppAssets.tv,AppAssets.pool,AppAssets.wifi,AppAssets.airCondition];
    final List<String> title=["TV","Pool","Wifi","Air Conditioning"];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.07,
            right: screenWidth * 0.07,
            top: screenHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Which of these best describes your place?',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Expanded(
              child: CustomGrid(svgPaths: svgPaths, title: title,),
            ),
          ],
        ),
      ),
    );
  }
}
