import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

import '../../../utility/enums.dart';
import '../../../utility/network_helper.dart';
import '../elevated_button_widget.dart';

class DialogsWidgetsSnackBar {

  static void showScaffoldSnackBar({
    required String title,
    required BuildContext context,
    Color color = AppStyle.redColor,
  }) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: k5RadiusLowerPadding,
          // ),
          dismissDirection: DismissDirection.none,
          content: Text(
            title,
            style: Theme.of(context).textTheme.headline5!.copyWith(color: AppStyle.kBackGroundColor),
          ),
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 70),
          backgroundColor: color,
          duration: const Duration(milliseconds: 1500),
        ))
        .closed
        .then((value) {
      //return ScaffoldMessenger.of(context).clearSnackBars();
    });
  }

  static void showSnackBarFromStatus({
    required BuildContext context,
    required HelperResponse helperResponse,
    bool showServerError = false,
    bool popOnSuccess = true,
    int popOnSuccessCount = 1,
  }) {
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      if(popOnSuccess){
        for(int i=0;i<popOnSuccessCount;i++){
          Navigator.of(context).pop();
        }
      }
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
          title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
          color: AppStyle.kGreenColor,
          context: context
      );

    }
    if(showServerError){
      if (helperResponse.servicesResponse == ServicesResponseStatues.networkError){
        return DialogsWidgetsSnackBar.showScaffoldSnackBar(
          title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
          context: context,
        );
      }
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
          title: helperResponse.response,
          color: AppStyle.redColor,
          context: context
      );
    }
    if (helperResponse.servicesResponse == ServicesResponseStatues.networkError){
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
        title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
        context: context,
      );
    }
    else {
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
        title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
        context: context,
      );
    }

  }


}
