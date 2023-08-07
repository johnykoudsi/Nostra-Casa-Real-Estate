import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nostra_casa/presentation/view_property/widgets/property_rating.dart';
import 'package:nostra_casa/presentation/view_property/widgets/spacing.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_amenities.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_attributes.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_images.dart';
import 'package:nostra_casa/utility/app_style.dart';
class ViewProperty extends StatefulWidget {
  const ViewProperty({Key? key}) : super(key: key);

  @override
  State<ViewProperty> createState() => _ViewPropertyState();
}

class _ViewPropertyState extends State<ViewProperty> {
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
                ViewPropertyImages(),
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
                      const Spacing(),
                      Text(
                        "This house is so great you can see the whole city from the roof ",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      const Spacing(),
                      Text(
                        "This property provides",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      ViewPropertyAttributes(),
                      const Spacing(),
                      Text(
                        "And in top of that",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const ViewPropertyAmenities(),
                      const Spacing(),
                      Text(
                        "Feel free to rate this property",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const PropertyRating(),
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
