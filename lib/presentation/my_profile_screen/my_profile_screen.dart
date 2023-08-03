import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_yes_no.dart';
import 'package:nostra_casa/presentation/my_profile_screen/widgets/MyProfileItem.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'package:nostra_casa/utility/constant_logic_validations.dart';

import '../../business_logic/user/user_bloc.dart';
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
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoggedState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.user.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: AppStyle.kBackGroundColor),
                        ),
                        Text(
                          state.user.user.mobile,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: AppStyle.kBackGroundColor),
                        ),
                      ],
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nostra Casa Guest".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: AppStyle.kBackGroundColor),
                      ),
                      // Text(
                      //   "",
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .headline5
                      //       ?.copyWith(color: AppStyle.kBackGroundColor),
                      // ),
                    ],
                  );
                },
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
                          Navigator.pushNamed(context, AppRoutes.notifications);
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
                          Navigator.pushNamed(context, AppRoutes.editProfile);
                        },
                        color: Colors.white),
                    if (!userIsLoggedIn(context))
                      MyProfileItem(
                          svgPath: AppAssets.share,
                          name: "Login".tr(),
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.login);
                          },
                          color: AppStyle.kBackGroundColor),
                    if (userIsLoggedIn(context))
                      MyProfileItem(
                          svgPath: AppAssets.share,
                          name: "Sign Out".tr(),
                          onPressed: () {
                            DialogsWidgetsYesNo.showYesNoDialog(
                                title: "Are you sure you want to sign out",
                                noTitle: "Cancel",
                                yesTitle: "Sign Out",
                                onYesTap: () {
                                  context.read<UserBloc>().add(LogoutEvent());
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRoutes.welcome,
                                      (Route<dynamic> route) => false);
                                },
                                onNoTap: () {
                                  Navigator.of(context).pop();
                                },
                                context: context);
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
