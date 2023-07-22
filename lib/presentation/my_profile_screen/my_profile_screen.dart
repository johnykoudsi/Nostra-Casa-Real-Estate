import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_yes_no.dart';
import 'package:nostra_casa/presentation/my_profile_screen/widgets/MyProfileItem.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_style.dart';

import '../../utility/app_routes.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.blackColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05,
                  bottom: screenHeight * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "user account".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: AppStyle.kBackGroundColor),
                  ),
                  Text(
                    "+963 784487474",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: AppStyle.kBackGroundColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppStyle.kBackGroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: ListView(
                  children: [
                    MyProfileItem(
                      svgPath: AppAssets.house,
                      name: "My Estates".tr(),
                      onPressed: () {
                        //todo navigate to my estates
                      },
                      color: AppStyle.kBackGroundColor,
                      borderRad: 40,
                    ),
                    MyProfileItem(
                        svgPath: AppAssets.favorites,
                        name: "My Favorites".tr(),
                        onPressed: () {
                          //todo navigate to my favorite
                        },
                        color: Colors.white),
                    MyProfileItem(
                        svgPath: AppAssets.bell,
                        name: "Notifications".tr(),
                        onPressed: () {
                          //todo navigate to notifications
                        },
                        color: AppStyle.kBackGroundColor),
                    MyProfileItem(
                        svgPath: AppAssets.about,
                        name: "About Us".tr(),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.aboutUs);
                        },
                        color: Colors.white),
                    MyProfileItem(
                        svgPath: AppAssets.language,
                        name: "Language".tr(),
                        onPressed: () {
                          DialogsWidgetsYesNo.showLanguageBottomSheet(context);
                        },
                        color: AppStyle.kBackGroundColor),
                    MyProfileItem(
                        svgPath: AppAssets.edit,
                        name: "Edit Profile".tr(),
                        onPressed: () {
                          //todo navigate to edit profile
                        },
                        color: Colors.white),
                    MyProfileItem(
                        svgPath: AppAssets.share,
                        name: "Sign Out".tr(),
                        onPressed: () {
                          //todo sign out
                        },
                        color: AppStyle.kBackGroundColor),
                    MyProfileItem(
                      svgPath: AppAssets.delete,
                      name: "Delete Account".tr(),
                      onPressed: () {
                        //todo delete account
                      },
                      color: Colors.white,
                      isDelete: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
