import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
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

  //List<String>propertyAttributesList=["Guest"];
  List<String> propertyAttributesList = [
    "guests",
    "bedrooms",
    "beds",
    "bathrooms",
    "balconies",
    "beds"
  ];
  List<int> propertyAttributesListValue = [2, 5, 25, 5, 3, 7];
  double _rating = 3;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.kBackGroundColor,
        body: Stack(
          children: [
            ListView(
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
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.038,
                      right: screenWidth * 0.038,
                      top: screenWidth * 0.038,
                      bottom: screenWidth * 0.038),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Property Name",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star),
                          Text(
                            "4.88",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                      Text(
                        "al-malki, Damascus, Syria",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Row(
                        children: [
                          Text(
                            "90000000 sp",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            " month",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: AppStyle.kGreyColor),
                          ),
                        ],
                      ),
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
                      Text(
                        "This house is so great you can see the whole city from the roof ",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
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
                      Text(
                        "This property provides",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Wrap(
                        children: List.generate(propertyAttributesList.length,
                            (index) {
                          return Wrap(
                            children: [
                              Text(
                                index > 0 ? ", " : "",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                propertyAttributesListValue[index].toString() +
                                    " ",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                propertyAttributesList[index],
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          );
                        }),
                      ),
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
                      Text(
                        "And in top of that",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      SizedBox(
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
                      ),
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
                      Text(
                        "Feel free to rate this property",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Center(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          unratedColor: Colors.amber.withAlpha(50),
                          itemCount: 5,
                          itemSize: 30.0,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          },
                          updateOnDrag: true,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: const CircleAvatar(
                      backgroundColor: AppStyle.kBackGroundColor,
                      child: Icon(
                        Icons.arrow_back,
                        color: AppStyle.blackColor,
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    icon: const CircleAvatar(
                        backgroundColor: AppStyle.kBackGroundColor,
                        child: Icon(
                          Icons.favorite_outline_sharp,
                          color: AppStyle.blackColor,
                        )),
                    onPressed: () {
                      //todo add property to favorite
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
