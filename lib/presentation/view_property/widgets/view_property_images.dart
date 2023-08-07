import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../utility/app_assets.dart';

class ViewPropertyImages extends StatelessWidget {
   ViewPropertyImages({Key? key}) : super(key: key);
  List<String> property = [
    AppAssets.welcome,
    AppAssets.welcome,
    AppAssets.welcome,
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.35,
      width: screenWidth,
      child: Swiper(
        loop: false,
        itemBuilder: (context, index) {
          final image = property[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: screenWidth * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.black45.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "${index + 1}/${property.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: false,
        itemCount: property.length,
        control: null,
      ),
    );
  }
}
