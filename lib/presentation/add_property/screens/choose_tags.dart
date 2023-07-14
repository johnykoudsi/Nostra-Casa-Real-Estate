import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nostra_casa/presentation/add_property/widgets/grid_item.dart';
import 'package:nostra_casa/utility/app_assets.dart';

import '../../../utility/app_style.dart';

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
            left: screenWidth * 0.07,
            right: screenWidth * 0.07,
            top: screenHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Which of these best describes your place?',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 15,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.6,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GridItem();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
