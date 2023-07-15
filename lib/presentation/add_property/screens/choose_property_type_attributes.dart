import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/attributes_list.dart';

import '../../../utility/app_style.dart';

class ChoosePropertyTypeAttributes extends StatefulWidget {
  const ChoosePropertyTypeAttributes({Key? key}) : super(key: key);

  @override
  State<ChoosePropertyTypeAttributes> createState() =>
      _ChoosePropertyTypeAttributesState();
}

class _ChoosePropertyTypeAttributesState
    extends State<ChoosePropertyTypeAttributes> {
  @override
  Widget build(BuildContext context) {
    final List<int> defaultNumbers =[5,997,13];
    final List<String> attributesNames =["Guests","Bedrooms","Beds"];
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
              'Share some basics about your place',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: screenHeight*0.01,),
            SizedBox(
              width: screenWidth,
              child: Text(
                'You\'ll add more details later',
                style: Theme.of(context).textTheme.headline6!.copyWith(color: AppStyle.kGreyColor),
              ),
            ),

            SizedBox(
              height: screenHeight * 0.03,
            ),
            Expanded(
              child: AttributesList(defaultNumbers: defaultNumbers, attributesNames: attributesNames,),
            ),
          ],
        ),
      ),
    );
  }
}
