import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';
import '../global_widgets/property_widgets/property_list_view.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: AllPropertyListView(),
    );
  }
}
