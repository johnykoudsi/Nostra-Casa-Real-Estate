import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';

class ViewPropertyAmenities extends StatelessWidget {
  const ViewPropertyAmenities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 100,
      child: GridView.builder(
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 25,
          ),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                  color: AppStyle.kBackGroundColor,
                  border: Border.all(
                    color: AppStyle.kGreyColor,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03,
                      right: screenWidth * 0.03,
                      top: screenWidth * 0.01),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.tv,
                            width: screenWidth * 0.07,
                            height: screenHeight * 0.045,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Wifi",
                            style: Theme.of(context)
                                .textTheme
                                .headline5,
                            //textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}
