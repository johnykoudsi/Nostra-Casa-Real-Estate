import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/screens/amenity/widget/custom_amenity_grid.dart';
import '../../../../utility/app_style.dart';

class ChooseAmenities extends StatelessWidget {
  const ChooseAmenities({Key? key}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tell us what you\'r place has to offer'.tr(),
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'You can add more amenities after you publish your property.'.tr(),
              style: Theme.of(context).textTheme.headline6!.copyWith(color: AppStyle.kGreyColor),
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
