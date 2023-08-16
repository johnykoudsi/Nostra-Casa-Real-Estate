import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostra_casa/data/models/user_model.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import 'package:nostra_casa/presentation/view_property/widgets/spacing.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';

class UserInfoPart extends StatelessWidget {
  UserInfoPart({required this.userInfo, Key? key}) : super(key: key);

  UserInfo userInfo;
  void openWhatsapp(
      {required BuildContext context, required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid = "whatsapp://send?phone=" + whatsapp;
    var whatsappURLIos = "https://wa.me/$whatsapp}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        DialogsWidgetsSnackBar.showScaffoldSnackBar(title: "Whatsapp not installed", context: context);
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        DialogsWidgetsSnackBar.showScaffoldSnackBar(title: "Whatsapp not installed", context: context);

      }
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacing(),
        Text(
          "Host Info".tr(),
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userInfo.name ?? "",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: AppFontWeight.medium)),
            Text(userInfo.mobile ?? "",
                style: Theme.of(context).textTheme.headline5),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        SizedBox(
          height: 100,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 1,
              crossAxisSpacing: 2,
              mainAxisSpacing: 25,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              oneContactInfoWidget(
                onPressed: () {
                  try {
                    launchUrl(Uri(
                        scheme: "tel", path: userInfo.mobile));
                    {
                      throw 'Could not launch ${userInfo.mobile}';
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                svg: AppAssets.phoneOut,
                title: "Call Now",
              ),
              oneContactInfoWidget(
                onPressed: () {
                  openWhatsapp(
                      context: context,
                      number: userInfo.mobile,
                  );
                },
                svg: AppAssets.whatsapp,
                title: "WhatsApp",
              ),
              if(userInfo.facebook.isNotEmpty)
              oneContactInfoWidget(
                onPressed: () {
                  try {
                    launchUrl(
                        Uri(
                        scheme: "https",
                        path: userInfo.facebook,
                    ),
                      mode: LaunchMode.externalApplication
                    );
                    {
                      throw 'Could not launch ${userInfo.facebook}';
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                svg: AppAssets.facebook,
                title: "Facebook",
              ),

            ],
          ),
        ),
      ],
    );
  }
}

class oneContactInfoWidget extends StatelessWidget {
  oneContactInfoWidget({
    Key? key,
    required this.onPressed,
    required this.svg,
    required this.title,
  }) : super(key: key);

  String svg;
  String title;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
            color: AppStyle.kBackGroundColor,
            border: Border.all(
              color: AppStyle.kGreyColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.03,
                right: screenWidth * 0.03,
                top: screenWidth * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: SvgPicture.asset(
                      svg,
                      width: screenWidth * 0.07,
                      height: screenHeight * 0.045,
                    ),
                  ),
                ),
                // Expanded(
                //   child: Center(
                //     child: Text(
                //       title,
                //       style: Theme.of(context).textTheme.headline5,
                //       //textAlign: TextAlign.center,
                //     ),
                //   ),
                // )
              ],
            ),
          )),
    );
  }
}
