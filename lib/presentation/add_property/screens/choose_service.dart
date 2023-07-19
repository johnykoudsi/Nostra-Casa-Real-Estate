import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';
import '../widgets/service_list.dart';
import '../widgets/types_list.dart';

class ChooseService extends StatefulWidget {
  const ChooseService({Key? key}) : super(key: key);

  @override
  State<ChooseService> createState() => _ChooseServiceState();
}

class _ChooseServiceState extends State<ChooseService> {
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
              'What service are you offering your property to?'.tr(),
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Expanded(
              child: ServicesList(),
            ),
          ],
        ),
      ),
    );
  }
}
