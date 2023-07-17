import 'package:flutter/material.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';
import '../widgets/types_list.dart';

class ChooseService extends StatefulWidget {
  const ChooseService({Key? key}) : super(key: key);

  @override
  State<ChooseService> createState() => _ChooseServiceState();
}

class _ChooseServiceState extends State<ChooseService> {
  @override
  Widget build(BuildContext context) {
    final List<String> svgPaths =[AppAssets.sale,AppAssets.rent,AppAssets.holiday];
    final List<String> title =["Sale","Rent","Holiday"];
    final List<String> description =["Refers to the transfer of property ownership from one party to another.","Refers to the payment made by a tenant to a landlord in exchange for the use of a property.","Refers to properties that are intended for short-term vacation or leisure use."];
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
              'What service are you offering your property to?',
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
