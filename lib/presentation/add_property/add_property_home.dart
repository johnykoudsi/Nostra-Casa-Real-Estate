import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_service.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_tags.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_type.dart';
import 'package:nostra_casa/presentation/add_property/widgets/progress_bar.dart';
import 'package:nostra_casa/presentation/add_property/screens/welcome_step.dart';

import '../../utility/app_style.dart';
import '../global_widgets/elevated_button_widget.dart';

class AddPropertyHome extends StatefulWidget {
  const AddPropertyHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddPropertyHomeState createState() => _AddPropertyHomeState();
}

class _AddPropertyHomeState extends State<AddPropertyHome> {
  int _currentStep = 0;
  final List<Widget> _steps = [
    const WelcomeStep(),
    const ChooseTags(),
    const ChooseType(),
    const ChooseService(),
  ];

  void _goToNextStep() {
    setState(() {
      if (_currentStep < _steps.length - 1) {
        _currentStep++;
      }
    });
  }

  void _goToPrevStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final progress = (_currentStep * 100) / _steps.length;

    return Scaffold(
      appBar: AppBar(
       // title: Text(_steps[_currentStep].toString()),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
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
              child: MyProgressBar(progressValue: progress),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: ElevatedButtonWidget(
                      title: 'Back',
                      onPressed: _goToPrevStep,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
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
