import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

class SubmitProperty extends StatefulWidget {
  const SubmitProperty({Key? key}) : super(key: key);

  @override
  State<SubmitProperty> createState() => _SubmitPropertyState();
}

class _SubmitPropertyState extends State<SubmitProperty> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,

    ));
  }
}
