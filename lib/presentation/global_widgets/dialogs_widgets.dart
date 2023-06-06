import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

import '../../utility/enums.dart';

class DialogsWidgets {

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
            style: Theme.of(context).textTheme.headline5,
          ),
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 70),
          backgroundColor: color,
          duration: const Duration(milliseconds: 1500),
        ))
        .closed
        .then((value) {
      return ScaffoldMessenger.of(context).clearSnackBars();
    });
  }

  static void showSnackBarFromStatus({
    required BuildContext context,
    required ServicesResponseStatues servicesResponseStatues,
  }) {
    if (servicesResponseStatues == ServicesResponseStatues.success) {
      return DialogsWidgets.showScaffoldSnackBar(
          title: "${serviceValues.reverse[servicesResponseStatues]}" ,
          color: AppStyle.kGreenColor,
          context: context
      );
    }
    if (servicesResponseStatues == ServicesResponseStatues.networkError){
      return DialogsWidgets.showScaffoldSnackBar(
        title: "${serviceValues.reverse[servicesResponseStatues]}" ,
        context: context,
      );
    }
    else {
      return DialogsWidgets.showScaffoldSnackBar(
        title: "${serviceValues.reverse[servicesResponseStatues]}" ,
        context: context,
      );
    }

  }


}
