import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/my_properties/widgets/my_properties_list.dart';

import '../../utility/app_style.dart';

class MyProperties extends StatefulWidget {
  const MyProperties({Key? key}) : super(key: key);

  @override
  State<MyProperties> createState() => _MyPropertiesState();
}

class _MyPropertiesState extends State<MyProperties> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            title: Text(
              "My Estates".tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: AppStyle.kBackGroundColor),
            ),
          ),
          body: MyPropertiesList(),
        ));
  }
}
