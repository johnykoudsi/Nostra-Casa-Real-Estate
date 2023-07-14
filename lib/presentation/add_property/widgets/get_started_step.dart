import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utility/app_style.dart';

class GetStartedStep extends StatefulWidget {
  const GetStartedStep({Key? key}) : super(key: key);

  @override
  State<GetStartedStep> createState() => _GetStartedStepState();
}

class _GetStartedStepState extends State<GetStartedStep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
    );
  }
}
