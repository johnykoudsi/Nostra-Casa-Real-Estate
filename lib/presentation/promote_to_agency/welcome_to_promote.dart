import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_yes_no.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_routes.dart';

import '../../utility/app_style.dart';
import '../../utility/constant_logic_validations.dart';
import '../global_widgets/elevated_button_widget.dart';

class WelcomeToPromote extends StatefulWidget {
  const WelcomeToPromote({Key? key}) : super(key: key);

  @override
  State<WelcomeToPromote> createState() => _WelcomeToPromoteState();
}

class _WelcomeToPromoteState extends State<WelcomeToPromote> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle.blackColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppStyle.kBackGroundColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.038,
                    vertical: screenWidth * 0.038),
                child: const Image(
                  image: AssetImage(AppAssets.agency),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.038,
                    vertical: screenWidth * 0.038),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Promote now and get your badge".tr(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      "We will need more information about your agency in order to confirm you promotion request".tr(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038, right: screenWidth * 0.038,bottom:  screenWidth * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButtonWidget(
              title: "Promote Now".tr(),
              onPressed: () {
                if(!userIsLoggedIn(context)){
                  DialogsWidgetsYesNo.showYesNoDialog(
                    title: "You must login to continue".tr(),
                    noTitle: "Cancel".tr(),
                    yesTitle: "Login".tr(),
                    onYesTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(AppRoutes.login);
                    },
                    onNoTap: () {
                      Navigator.of(context).pop();
                    },
                    context: context,
                  );
                  return;
                }
                Navigator.of(context).pushNamed(AppRoutes.promoteToAgency);
              },
            )
          ],
        ),
      ),
    );
  }
}
