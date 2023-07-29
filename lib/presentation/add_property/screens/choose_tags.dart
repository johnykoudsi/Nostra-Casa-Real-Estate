import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import '../../../utility/app_style.dart';
import 'amenity/widget/custom_amenity_grid.dart';

class ChooseTags extends StatefulWidget {
  const ChooseTags({Key? key}) : super(key: key);


  @override
  State<ChooseTags> createState() => _ChooseTagsState();
}

class _ChooseTagsState extends State<ChooseTags> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Which of these best describes your place?'.tr(),
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Expanded(
              child: CustomAmenityGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
