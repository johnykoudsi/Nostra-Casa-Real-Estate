import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

import '../../utility/app_assets.dart';

class ViewProperty extends StatefulWidget {
  const ViewProperty({Key? key}) : super(key: key);

  @override
  State<ViewProperty> createState() => _ViewPropertyState();
}

class _ViewPropertyState extends State<ViewProperty> {
  List<String> property = [
    AppAssets.welcome,
    AppAssets.welcome,
    AppAssets.welcome,
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.kBackGroundColor,
        body: ListView(
          children: [
            SizedBox(
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
                        top: 10,
                        right: 10,


                        child: GestureDetector(
                          onTap:(){},
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppStyle.kBackGroundColor,
                            ),
                            child: Icon(Icons.favorite_outline_sharp,
                                color: AppStyle.blackColor),
                          ),
                        ),

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
                              style: Theme
                                  .of(context)
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
            ),
          ],
        ),
      ),
    );
  }
}
