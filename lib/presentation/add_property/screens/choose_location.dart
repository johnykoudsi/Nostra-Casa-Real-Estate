import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/map_screen/map_screen.dart';

import '../../../utility/app_style.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
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
              'Where\'s your place locates?',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'Your address is only shared with clients after they\'ve made an account',
              style: Theme.of(context).textTheme.headline6!.copyWith(color: AppStyle.kGreyColor),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Expanded(
              child: MapScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
