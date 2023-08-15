import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_routes.dart';
import 'package:nostra_casa/utility/app_style.dart';

class SliverAppBarWidgetWithSearch extends StatefulWidget {
  SliverAppBarWidgetWithSearch({
    required this.title,
    required this.bottom,
    Key? key,
  }) : super(key: key);

  String title;
  AppBar bottom;

  @override
  State<SliverAppBarWidgetWithSearch> createState() =>
      _SliverAppBarWidgetWithSearchState();
}

class _SliverAppBarWidgetWithSearchState
    extends State<SliverAppBarWidgetWithSearch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      backgroundColor: AppStyle.mainColor,
      elevation: 0,

      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 15,
              height: 15,
            ),
            Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: AppStyle.kBackGroundColor),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.notifications);
              },
              child: SizedBox(
                width: getWidth * 0.06,
                height: getWidth * 0.06,
                child: SvgPicture.asset(
                  AppAssets.bell,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottom: widget.bottom,
      // actions: const [
      //   Icon(Icons.notifications),
      // ],
      //leading: const Icon(Icons.pin_drop_rounded,color: Colors.white,),
    );
  }
}
