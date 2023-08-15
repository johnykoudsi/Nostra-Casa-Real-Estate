import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/add_to_favorite/add_favorite_bloc.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/data/models/special_attributes.dart';
import 'package:nostra_casa/presentation/view_property/widgets/property_rating.dart';
import 'package:nostra_casa/presentation/view_property/widgets/spacing.dart';
import 'package:nostra_casa/presentation/view_property/widgets/user_info_part.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_amenities.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_attributes.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_images.dart';
import 'package:nostra_casa/utility/app_routes.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import '../../data/models/properties_model.dart';
import '../../utility/app_assets.dart';
import '../map_location_square_widget/map_location_widget.dart';

class ViewProperty extends StatelessWidget {
  ViewProperty({required this.property, Key? key}) : super(key: key);

  Property property;

  Future<File> urlToFile(String imageUrl) async {
// generate random number.
    var rng = Random();
// get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
    String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
    File file = File('$tempPath${rng.nextInt(100)}.png');
// call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(Uri.parse(imageUrl));
// write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
    return file;
  }

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
                      child: ViewPropertyImages(
                        imagesUrl: property.media,
                        propertyService: property.propertyService,
                      ),
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
                        "Enjoy Virtual Reality View".tr(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.virtualReality);
                        },
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius: AppStyle.k15BorderRadius,
                              image: DecorationImage(
                                image: AssetImage(
                                  AppAssets.virtualReality,
                                ),
                                fit: BoxFit.fitWidth,
                              )),
                        ),
                      ),
                      const Spacing(),
                      Text(
                        "Where you will be".tr(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Stack(
                        children: [
                          MapLocationSquareWidget(
                            latLng: property.location,
                            propertyType: property.propertyType,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AppRoutes.streetViewMaps,
                                  arguments: property.location);
                            },
                            child: Container(
                              height: 150,
                              width: screenWidth,
                              color: Colors.white10,
                            ),
                          )
                        ],
                      ),
                      if (property.userInfo != null)
                        UserInfoPart(
                          userInfo: property.userInfo!,
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
                          Icons.share,
                          color: AppStyle.blackColor,
                        )),
                    onPressed: () async {
                      if(property.media.isNotEmpty){
                        File file = await urlToFile(property.media[0]);
                        await Share.shareFiles([file.path],
                            text: 'Share this ${property.name} !' +
                                "\n Download Nostra Casa now !!" +
                                "\n Android Link: " +
                                "\n IOS Link:");
                      }else{
                        await Share.share('Share this ${property.name} !' +
                                "\n Download Nostra Casa now !!" +
                                "\n Android Link: " +
                                "\n IOS Link:");
                      }
                    },
                  ),
                  if (context.read<UserBloc>().state is UserLoggedState)
                    BlocBuilder<OnePropertyBloc, OnePropertyState>(
                      builder: (context, state) {
                        if (state is OnePropertyDoneState) {
                          return IconButton(
                            icon: CircleAvatar(
                                backgroundColor: AppStyle.kBackGroundColor,
                                child: Icon(
                                  state.favouriteState
                                      ? Icons.favorite
                                      : Icons.favorite_outline_sharp,
                                  color: state.favouriteState
                                      ? AppStyle.redColor
                                      : AppStyle.blackColor,
                                )),
                            onPressed: () {
                              context.read<OnePropertyBloc>().add(
                                  ToggleFavouriteEvent(
                                      productObjectId: property.id));
                            },
                          );
                        }
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
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
