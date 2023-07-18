import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/types_list.dart';
import 'package:nostra_casa/utility/app_assets.dart';

import '../../../utility/app_style.dart';

class ChooseType extends StatefulWidget {
  const ChooseType({Key? key}) : super(key: key);

  @override
  State<ChooseType> createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {
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
              'Define your place',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Expanded(
              child: TypesList(),
            ),
          ],
        ),
      ),
    );
  }
}
