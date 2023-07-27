import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
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
    final addPropertyBloc = context.watch<AddPropertyBloc>();
print(addPropertyBloc.state.propertyTypeAttributes);
    final List<String> svgPaths=[AppAssets.tv,AppAssets.pool,AppAssets.wifi,AppAssets.airCondition];
    final List<String> title=["TV","Pool","Wifi","Air Conditioning"];
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
            Expanded(
              child: CustomAmenityGrid(svgPaths: svgPaths, title: title,),
            ),
          ],
        ),
      ),
    );
  }
}
