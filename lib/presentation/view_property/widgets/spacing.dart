import 'package:flutter/material.dart';

import '../../../utility/app_style.dart';

class Spacing extends StatelessWidget {
  const Spacing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.02,
        ),
        const Divider(
          color: AppStyle.kGreyColor,
          thickness: 0.8,
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
      ],
    );
  }
}
