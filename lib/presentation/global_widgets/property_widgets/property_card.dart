import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';

class PropertyCard extends StatelessWidget {
   PropertyCard({Key? key,required this.properties,required this.indexInTheVerticalList}) : super(key: key);
  List<List<String>> properties = [];
  int indexInTheVerticalList;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.038,
          right: screenWidth * 0.038,
          bottom: screenWidth * 0.038,
          top: screenWidth * 0.038),
      child: SizedBox(
        width: screenWidth * 0.7,
        height: screenHeight * 0.56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Swiper(
                  itemBuilder: (context, indexInTheHorizontalList) {
                    final image = properties[indexInTheVerticalList][indexInTheHorizontalList];
                    return FadeInImage(placeholder: const AssetImage(AppAssets.greyLogo), image: AssetImage(image),
                      fit: BoxFit.fill,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1,color: AppStyle.kGreyColor),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(AppAssets.greyLogo,fit: BoxFit.contain,)));
                      },
                    );
                  },
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  autoplay: false,
                  itemCount: properties[indexInTheVerticalList].length,
                  pagination: const SwiperPagination(),
                  control: null,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Damascus, Syria",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.03,right: screenWidth*0.03,top: screenWidth*0.01),
                  child: Row(
                    children: [
                      const Icon(Icons.star),
                      Text("4.88",style: Theme.of(context).textTheme.headline5,),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              "Great House",
              style: Theme.of(context).textTheme.headline5!.copyWith(color: AppStyle.kGreyColor),
            ),
            Row(
              children: [
                Text(
                  "90000 \$",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  " month",
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: AppStyle.kGreyColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
