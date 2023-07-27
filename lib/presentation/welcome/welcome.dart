import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_yes_no.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_routes.dart';
import 'package:nostra_casa/utility/app_style.dart';
import '../global_widgets/elevated_button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(AppAssets.welcome),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    AppStyle.mainColor.withOpacity(0.7), BlendMode.darken),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(getWidth * 0.038, getHeight * 0.5,
                getWidth * 0.038, getWidth * 0.038),
            child: Column(
              children: [
                Text('Hello !'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: AppStyle.kBackGroundColor)),
                Text('Welcome to NostraCasa'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: AppStyle.kBackGroundColor)),
                Padding(
                  padding: EdgeInsets.only(top: getHeight * 0.04),
                  child: Column(
                    children: [
                      ElevatedButtonWidget(
                        title: 'Login'.tr(),
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.login);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButtonWidget(
                          title: 'Signup'.tr(),
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.signup);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.bottomNavBar);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Continue as a '.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: AppStyle.kBackGroundColor)),
                            Text('Guest'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: AppStyle.kBackGroundColor)),
                          ],
                        ),
                      ),
                      // Divider(
                      //   height: 25 * SizeConfig.blockSizeHorizontal,
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          DialogsWidgetsYesNo.showLanguageBottomSheet(context);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30 / 2),
                            color: AppStyle.kGreyColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 25,
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 10),
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.translate_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
