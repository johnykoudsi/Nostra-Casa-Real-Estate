import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';

class GridItem extends StatefulWidget {
  GridItem({Key? key}) : super(key: key);

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          clicked = !clicked;
        });
      },
      child: Container(
          decoration: BoxDecoration(
            color: clicked ? AppStyle.kGreyColor : AppStyle.kBackGroundColor,
            border: Border.all(
              color: clicked ? AppStyle.blackColor : AppStyle.kGreyColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppAssets.house,
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.05,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  'House',
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          )),
    );
  }
}
