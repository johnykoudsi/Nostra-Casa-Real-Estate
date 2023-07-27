import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';
import 'package:nostra_casa/presentation/global_widgets/custom_text_field.dart';

import '../../../utility/app_style.dart';
import '../elevated_button_widget.dart';

class DialogsWidgetsYesNo {
  static void showYesNoDialog({
    TextEditingController? attributeNumberController,
    TextEditingController? attributeNameController,
    String? operationName,
    required String title,
    required String noTitle,
    required String yesTitle,
    required Function() onYesTap,
    Function()? changePropertyAttribute,
    required Function() onNoTap,
    required BuildContext context,
    GlobalKey<FormState>? key,
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
                        mainColor: AppStyle.kGreyColor,
                        gradientColor: AppStyle.kGreyColor,
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

  static Future<bool> textFieldDialog(
      {required BuildContext context,
      key,
      operationName,
      attributeNameController,
      attributeNumberController,
      changePropertyAttribute,
      enable}) async {
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
                getWidth * 0.038, getWidth * 0.12),
            child: Wrap(
              spacing: 10,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth * 0.01,
                  ),
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                              operationName == "Add"
                                  ? "Please add name and number for your special attribute"
                                  : "Please edit the number of the attribute",
                              style: Theme.of(context).textTheme.headline3,
                              textAlign: TextAlign.center),
                        ),
                        Visibility(
                          visible: enable,
                          child: CustomTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name is required";
                              }
                            },
                            hintText: "Special Name",
                            passwordBool: false,
                            controller: attributeNameController,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: getWidth * 0.0),
                          child: CustomTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Number is required";
                              } else if (int.parse(value.toString()) < 0 ||
                                  int.parse(value.toString()) > 999) {
                                return "Attribute value should be between 0 and 1000";
                              }
                            },
                            hintText: "25",
                            passwordBool: false,
                            textInputType: TextInputType.number,
                            controller: attributeNumberController,
                          ),
                        ),
                        SizedBox(
                          height: getHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 6,
                              child: ElevatedButtonWidget(
                                title: "Cancel".tr(),
                                onPressed: () => Navigator.of(context).pop(false),
                              ),
                            ),
                            SizedBox(
                              width: getWidth * 0.038,
                            ),
                            Expanded(
                              flex: 6,
                              child: ElevatedButtonWidget(
                                  title: operationName,
                                  onPressed:

                                      changePropertyAttribute,



                                  ),
                            ),
                          ],
                        ),
                        // ElevatedButtonWidget(
                        //   title: "Add".tr(),
                        //   onPressed: addPropertyAttribute,
                        // ),
                      ],
                    ),
                  ),
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

  static Future<bool> alreadyExistDialog(BuildContext context, name) async {
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
                getWidth * 0.038, getWidth * 0.12),
            child: Wrap(
              spacing: 10,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth * 0.01,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(name + " is already exist",
                            style: Theme.of(context).textTheme.headline3,
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: getHeight * 0.1,
                      ),
                      ElevatedButtonWidget(
                        title: "Cancel".tr(),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),

                      // ElevatedButtonWidget(
                      //   title: "Add".tr(),
                      //   onPressed: addPropertyAttribute,
                      // ),
                    ],
                  ),
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
                  child: Text("Are you sure you want to exit !".tr(),
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
                        title: "Cancel".tr(),
                        mainColor: AppStyle.kGreyColor,
                        gradientColor: AppStyle.kGreyColor,
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    ),
                    SizedBox(
                      width: getWidth * 0.038,
                    ),
                    Expanded(
                      flex: 6,
                      child: ElevatedButtonWidget(
                        title: "Exit".tr(),
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

  static void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          double getWidth = MediaQuery.of(context).size.width;
          String? radioValue = context.locale.languageCode;
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(getWidth * 0.038),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RadioListTile(
                          contentPadding: const EdgeInsets.all(0),
                          activeColor: AppStyle.mainColor,
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
                          contentPadding: const EdgeInsets.all(0),
                          activeColor: AppStyle.mainColor,
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
                          context.setLocale(Locale(radioValue ?? 'en'));
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
