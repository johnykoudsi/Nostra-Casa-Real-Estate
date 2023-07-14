import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/get_started_step.dart';
import 'package:nostra_casa/presentation/add_property/widgets/progress_bar.dart';
import 'package:nostra_casa/presentation/add_property/widgets/welcome_step.dart';

import '../../utility/app_style.dart';
import '../global_widgets/elevated_button_widget.dart';

class AddPropertyHome extends StatefulWidget {
  @override
  _AddPropertyHomeState createState() => _AddPropertyHomeState();
}

class _AddPropertyHomeState extends State<AddPropertyHome> {
  int _currentStep = 0;
  List<Widget> _steps = [
    WelcomeStep(),
    GetStartedStep(),
  ];

  void _goToNextStep() {
    setState(() {
      _currentStep++;
    });
  }

  void _goToPrevStep() {
    setState(() {
      _currentStep--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(_steps[_currentStep].toString()),
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: _steps[_currentStep],
      ),
      bottomNavigationBar: Container(
        color: AppStyle.kBackGroundColor,
        height: screenHeight * 0.15,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.01,
                bottom: screenHeight * 0.04,
              ),
              child: MyProgressBar(
                totalSegments: _steps.length,
                currentSegment: _currentStep,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: ElevatedButtonWidget(
                      title: 'Back',
                      onPressed: _goToPrevStep,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: ElevatedButtonWidget(
                      title: 'Next',
                      onPressed: _goToNextStep,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}