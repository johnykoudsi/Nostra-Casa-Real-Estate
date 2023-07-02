import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utility/app_style.dart';
import '../elevated_button_widget.dart';

class DialogsWidgetsYesNo {

  static void showYesNoDialog({
    required String title,
    required String noTitle,
    required String yesTitle,
    required Function() onYesTap,
    required Function() onNoTap,
    required BuildContext context,
  }) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    var alertDialog = Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(15),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: getHeight * 0.01,
          ),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: AppStyle.k15BorderRadius,
                color: AppStyle.kBackGroundColor),
            padding: EdgeInsets.fromLTRB(getWidth * 0.038, getWidth * 0.1,
                getWidth * 0.038, getWidth * 0.038),
            child: Wrap(
              spacing: 10,
              children: [
                Center(
                  child: Text(title,
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center),
                ),
                SizedBox(height: getWidth * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButtonWidget(
                        title: noTitle,
                        color: AppStyle.kGreyColor,
                        onPressed: onNoTap,
                      ),
                    ),
                    SizedBox(
                      width: getWidth * 0.038,
                    ),
                    Expanded(
                      child: ElevatedButtonWidget(
                          title: yesTitle, onPressed: onYesTap),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  static Future<bool> onWillPopMethod(BuildContext context) async {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;

    var alertDialog = Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(15),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: getHeight * 0.01,
          ),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: AppStyle.k4RadiusLowerPadding,
                color: AppStyle.kBackGroundColor),
            padding: EdgeInsets.fromLTRB(getWidth * 0.038, getWidth * 0.1,
                getWidth * 0.038, getWidth * 0.038),
            child: Wrap(
              spacing: 10,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text("Are you sure you want to exit !",
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center),
                ),
                SizedBox(height: getWidth * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 6,
                      child: ElevatedButtonWidget(
                        title: "Cancel",
                        color: AppStyle.kGreyColor,
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    ),
                    SizedBox(
                      width: getWidth * 0.038,
                    ),
                    Expanded(
                      flex: 6,
                      child: ElevatedButtonWidget(
                        title: "Exit",
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
    return (await showDialog(
            context: context,
            builder: (BuildContext context) {
              return alertDialog;
            })) ??
        false;
  }

  static void showLanguageBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          double getWidth = MediaQuery.of(context).size.width;
          String? radioValue = context.locale.languageCode;
          return StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                  EdgeInsets.all(getWidth * 0.038),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      RadioListTile(
                          contentPadding:
                          const EdgeInsets.all(0),
                          activeColor:
                          AppStyle.darkBlueColor,
                          title: const Text(
                            "English",
                          ),
                          value: "en",
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value;
                            });
                          }),
                      RadioListTile(
                          contentPadding:
                          const EdgeInsets.all(0),
                          activeColor:
                          AppStyle.darkBlueColor,
                          title: const Text(
                            "العربية",
                          ),
                          value: "ar",
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value;
                            });
                          }),
                      ElevatedButtonWidget(
                        title: 'Save'.tr(),
                        onPressed: () {
                          context.setLocale(Locale(
                              radioValue ?? 'en'));
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
    );
  }
}
