import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';

class ViewPropertyImages extends StatelessWidget {
  ViewPropertyImages({required this.imagesUrl, Key? key}) : super(key: key);
  List<String> imagesUrl;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenWidth ,
      width: screenWidth,
      child: Swiper(
        loop: false,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
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
        itemCount: imagesUrl.isNotEmpty? imagesUrl.length : 1,
        control: null,
      ),
    );
  }
}
