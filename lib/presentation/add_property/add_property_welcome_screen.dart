import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/progress_bar.dart';
import 'package:nostra_casa/utility/app_style.dart';

class AddPropertyWelcomeScreen extends StatefulWidget {
  const AddPropertyWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<AddPropertyWelcomeScreen> createState() =>
      _AddPropertyWelcomeScreenState();
}

class _AddPropertyWelcomeScreenState extends State<AddPropertyWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.kBackGroundColor,
        bottomSheet: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: MyProgressBar(totalSegments:5, currentSegment: 4),
        ),
      ),
    );
  }
}
