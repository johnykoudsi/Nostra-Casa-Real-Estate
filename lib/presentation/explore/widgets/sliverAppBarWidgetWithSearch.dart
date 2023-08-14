import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_routes.dart';
import 'package:nostra_casa/utility/app_style.dart';

class SliverAppBarWidgetWithSearch extends StatelessWidget {
  SliverAppBarWidgetWithSearch({
    required this.title,
    Key? key,
  }) : super(key: key);

  String title;
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
              title,
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
      bottom: AppBar(
        toolbarHeight: getHeight * 0.08,
        elevation: 0,
        backgroundColor: AppStyle.mainColor,
        foregroundColor: AppStyle.kBackGroundColor,
        title: SizedBox(
          height: getHeight * 0.045,
          child: GestureDetector(
            onTap: () {},
            child: TextFormField(
              onFieldSubmitted: (value) {},
              style: const TextStyle(color: AppStyle.mainColor),
              keyboardType: TextInputType.name,
              enabled: false,
              cursorColor: AppStyle.mainColor,
              decoration: InputDecoration(
                hintText: 'Search'.tr(),
                hintStyle: const TextStyle(
                  color: AppStyle.kGreyColor,
                ),
                contentPadding: const EdgeInsets.only(
                    left: 15, bottom: 0, top: 0, right: 15),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    color: AppStyle.kGreyColor,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    )),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      width: 2,
                      color: AppStyle.mainColor,
                    )),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: AppStyle.mainColor,
                    )),
              ),
            ),
          ),
        ),
      ),
      // actions: const [
      //   Icon(Icons.notifications),
      // ],
      //leading: const Icon(Icons.pin_drop_rounded,color: Colors.white,),
    );
  }
}
