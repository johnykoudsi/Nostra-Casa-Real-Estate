import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nostra_casa/data/models/special_attributes.dart';
import 'package:nostra_casa/presentation/view_property/widgets/property_rating.dart';
import 'package:nostra_casa/presentation/view_property/widgets/spacing.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_amenities.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_attributes.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_images.dart';
import 'package:nostra_casa/utility/app_routes.dart';
import 'package:nostra_casa/utility/app_style.dart';

import '../../data/models/properties_model.dart';
import '../map_location_square_widget/map_location_widget.dart';

class ViewProperty extends StatelessWidget {
  ViewProperty({required this.property, Key? key}) : super(key: key);

  Property property;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                GestureDetector(
                    onTap: () {
                      if (property.media.isEmpty) {
                        return;
                      }
                      Navigator.of(context).pushNamed(
                          AppRoutes.staggeredImagesView,
                          arguments: property.media);
                    },
                    child: Hero(
                      tag: property.id,
                      child: ViewPropertyImages(imagesUrl: property.media),
                    )),
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
                        property.name,
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
                            "${NumberFormat.decimalPattern().format(property.price)} SYP",
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
                        property.description,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      const Spacing(),
                      Text(
                        "This property provides".tr(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      ViewPropertyAttributes(
                        abstractPropertyAttributes: property.agricultural ??
                            property.commercial ??
                            property.residential ??
                            AgriculturalPropertyAttributes(waterSources: 20),
                      ),
                      if (property.amenities.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacing(),
                            Text(
                              "And in top of that".tr(),
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            ViewPropertyAmenities(
                              amenities: property.amenities,
                            ),
                          ],
                        ),
                      const Spacing(),
                      Text(
                        "Where you will be".tr(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      MapLocationSquareWidget(
                        latLng: property.location,
                        propertyType: property.propertyType,
                      ),
                      const Spacing(),
                      Text(
                        "Connect Now".tr(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const Spacing(),
                      Text(
                        "Feel free to rate this property".tr(),
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
