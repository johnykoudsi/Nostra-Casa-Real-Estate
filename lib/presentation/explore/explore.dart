import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_style.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<List<String>> properties = [
    [AppAssets.welcome, AppAssets.welcome, AppAssets.welcome],
    [AppAssets.welcome, AppAssets.welcome, AppAssets.welcome]
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: ListView.builder(
          itemCount: properties.length,
          itemBuilder: (BuildContext context, int index1) {
            return Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.038,
                  right: screenWidth * 0.038,
                  bottom: screenWidth * 0.038,
                  top: screenWidth * 0.038),
              child: SizedBox(
                width: screenWidth * 0.7,
                height: screenHeight * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Swiper(
                          itemBuilder: (context, index2) {
                            final image = properties[index1][index2];
                            return Image.asset(
                              image,
                              fit: BoxFit.fill,
                            );
                          },
                          indicatorLayout: PageIndicatorLayout.COLOR,
                          autoplay: false,
                          itemCount: properties[index1].length,
                          pagination: const SwiperPagination(),
                          control: null,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Great House",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Icon(Icons.star),
                      ],
                    ),
                    Text(
                      "900000000 \$",
                      style: Theme.of(context).textTheme.headline5!.copyWith(color: AppStyle.kGreyColor),
                    ),
                    Text(
                      "available for rent",
                      style: Theme.of(context).textTheme.headline5!.copyWith(color: AppStyle.kGreyColor),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
