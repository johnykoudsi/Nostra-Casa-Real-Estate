import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../data/models/properties_model.dart';
import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';
import '../../../utility/enums.dart';

class PropertyCard extends StatelessWidget {
  PropertyCard({
    Key? key,
    required this.property,
  }) : super(key: key);
  Property property;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.038,
          right: screenWidth * 0.038,
          bottom: screenWidth * 0.038,
          top: screenWidth * 0.038),
      child: SizedBox(
        width: screenWidth * 0.7,
        //height: screenHeight * 0.56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  height: screenWidth * 0.7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Swiper(
                      itemCount:
                          property.media.isEmpty ? 1 : property.media.length,
                      indicatorLayout: PageIndicatorLayout.COLOR,
                      autoplay: false,
                      loop: false,
                      pagination: const SwiperPagination(),
                      itemBuilder: (context, index) {
                        return FadeInImage(
                          placeholder: const AssetImage(AppAssets.greyLogo),
                          image: NetworkImage(property.media.isEmpty
                              ? ""
                              : property.media[index]),
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 1, color: AppStyle.kGreyColor),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  AppAssets.greyLogo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                if (property.propertyService != null)
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 1.5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: AppStyle.k4RadiusLowerPadding,
                      color: AppStyle.mainColor.withOpacity(0.8),
                    ),
                    child: Text(
                      propertyServiceBackEnd2.reverse[property.propertyService]
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: AppStyle.kBackGroundColor),
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Damascus, Syria",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03,
                      right: screenWidth * 0.03,
                      top: screenWidth * 0.01),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        "4.88",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(property.name, style: Theme.of(context).textTheme.headline5!
                // .copyWith(color: AppStyle.kGreyColor),
                ),
            Row(
              children: [
                Text(
                  "${NumberFormat.decimalPattern().format(property.price)} SYP",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                    propertyServicePriceUI.reverse[property.propertyService]??'',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: AppStyle.kGreyColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
