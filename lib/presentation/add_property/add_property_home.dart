import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/add_property_bottom_navigator.dart';
import 'package:nostra_casa/presentation/add_property/widgets/add_property_screens.dart';

class AddPropertyHome extends StatefulWidget {
  const AddPropertyHome({super.key});

  @override
  AddPropertyHomeState createState() => AddPropertyHomeState();
}

class AddPropertyHomeState extends State<AddPropertyHome> {
  int screensNumber = 9;
  void _goToNextStep() {
    setState(() {
      if (stepNumber < screensNumber) {
        stepNumber++;
      }
    });
  }

  void _goToPrevStep() {
    setState(() {
      if (stepNumber > 0) {
        stepNumber--;
      }
    });
  }

  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  int stepNumber = 0;
  bool isReverse = false;

  @override
  Widget build(BuildContext context) {
    final progress = (stepNumber * 100) / screensNumber;
    return Scaffold(
      appBar: AppBar(
          ),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 600),
        reverse: context.locale.languageCode == 'ar' ? !isReverse : isReverse,
        transitionBuilder: (Widget child, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: _transitionType,
            child: child,
          );
        },
        child: GetSelectedScreenByStepNumber(
          stepNumber: stepNumber,
          key: Key(stepNumber.toString()),
        ),
      ),
      bottomNavigationBar: AddPropertyBottomNavigator(
        onPressedBack: _goToPrevStep,
        onPressedNext: _goToNextStep,
        progress: progress,
        stepNumber: stepNumber,
      ),
    );
  }
}
