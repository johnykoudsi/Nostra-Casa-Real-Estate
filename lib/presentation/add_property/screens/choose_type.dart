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
    final List<String> svgPaths =[AppAssets.house,AppAssets.agricultural,AppAssets.commercial];
    final List<String> title =["Residential","Agricultural","commercial"];
    final List<String> description =["Refers to properties that are designed and used primarily for living purposes.","Refers to land that is used or suitable for farming or other agricultural purposes.","Refers to properties that are intended for business or profit-making activities"];
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
              'Define your place',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Expanded(
              child: TypesList(description: description,svgPaths: svgPaths,title: title,),
            ),
          ],
        ),
      ),
    );
  }
}
