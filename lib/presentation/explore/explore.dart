import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/global_widgets/property_widgets/property_card.dart';
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
          itemBuilder: (BuildContext context, int index) {
            return PropertyCard(properties: properties, indexInTheVerticalList: index);
          }),
    );
  }
}
