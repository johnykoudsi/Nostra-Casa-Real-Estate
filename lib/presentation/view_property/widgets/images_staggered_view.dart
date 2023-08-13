import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';

class ImagesStaggeredView extends StatelessWidget {
  ImagesStaggeredView({required this.images, Key? key}) : super(key: key);

  List<String> images;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.same,
          pattern: [
            const QuiltedGridTile(2, 2),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: images.length,
          (context, index) => InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => _ImageGalleryScreen(
                    startID: index,
                    images: images,
                  ),
                ),
              );
            },
            child: Hero(
              tag: "${images[index]}$index",
              child: FadeInImage(
                placeholder: const AssetImage(AppAssets.greyLogo),
                image: NetworkImage(images[index]),
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AppAssets.greyLogo,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageGalleryScreen extends StatelessWidget {
  _ImageGalleryScreen({required this.startID, required this.images});

  int startID;
  List<String> images;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    PageController pageController = PageController(initialPage: startID);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PhotoViewGallery.builder(
              itemCount: images.length,
              pageController: pageController,
              scrollDirection: Axis.horizontal,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  maxScale: PhotoViewComputedScale.contained * 4,
                  minScale: PhotoViewComputedScale.contained * 0.70,
                  heroAttributes: PhotoViewHeroAttributes(tag: "${images[index]}$index"),
                  imageProvider: NetworkImage(images[index]),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: context.locale.languageCode == 'ar'
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: CircleAvatar(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: AppStyle.mainColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
