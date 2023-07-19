import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_routes.dart';

import '../../utility/app_style.dart';
import '../global_widgets/elevated_button_widget.dart';

class WelcomeStep extends StatefulWidget {
  const WelcomeStep({Key? key}) : super(key: key);

  @override
  State<WelcomeStep> createState() => _WelcomeStepState();
}

class _WelcomeStepState extends State<WelcomeStep> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.15,
              ),
              const Image(
                image: AssetImage(AppAssets.internalHouse),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.038,
                    vertical: screenWidth * 0.038),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tell us about your place'.tr(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Welcome to our platform! Add your property effortlessly and connect with potential "
                              "renters or buyers. Start maximizing your property's potential today!"
                          .tr(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButtonWidget(
                      title: "Add Now".tr(),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.addProperty);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.15, right: screenWidth * 0.15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
