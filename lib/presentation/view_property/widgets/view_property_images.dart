import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/enums.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';

class ViewPropertyImages extends StatelessWidget {
  ViewPropertyImages(
      {required this.propertyService, required this.imagesUrl, Key? key})
      : super(key: key);
  List<String> imagesUrl;
  PropertyService? propertyService;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenWidth,
      width: screenWidth,
      child: Swiper(
        loop: false,
        itemBuilder: (context, index) {
          return Stack(
            //fit: StackFit.,
            alignment: Alignment.bottomLeft,
            children: [
              FadeInImage(
                placeholder: const AssetImage(AppAssets.greyLogo),
                image: NetworkImage(imagesUrl.isEmpty ? "" : imagesUrl[index]),
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AppAssets.greyLogo,
                    fit: BoxFit.cover,
                  );
                },
              ),
              if (propertyService != null)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: AppStyle.k4RadiusLowerPadding,
                    color: AppStyle.mainColor.withOpacity(0.8),
                  ),
                  child: Text(
                    propertyServiceBackEnd2.reverse[propertyService].toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: AppStyle.kBackGroundColor),
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
                      "${index + 1}/${imagesUrl.length}",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
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
        itemCount: imagesUrl.isNotEmpty ? imagesUrl.length : 1,
        control: null,
      ),
    );
  }
}
