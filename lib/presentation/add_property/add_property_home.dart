import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/screens/add_property_images.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_amenities.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_location.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_property_type_attributes.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_service.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_tags.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_type.dart';
import 'package:nostra_casa/presentation/add_property/widgets/add_property_bottom_navigator.dart';
import 'package:nostra_casa/presentation/add_property/widgets/add_property_screens.dart';
import 'package:nostra_casa/presentation/add_property/widgets/progress_bar.dart';
import 'package:nostra_casa/presentation/add_property/screens/welcome_step.dart';

import '../../utility/app_style.dart';
import '../global_widgets/elevated_button_widget.dart';

class AddPropertyHome extends StatefulWidget {
  const AddPropertyHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  AddPropertyHomeState createState() => AddPropertyHomeState();
}

class AddPropertyHomeState extends State<AddPropertyHome> {

  void _goToNextStep() {
    setState(() {
       if (stepNumber < 7) {
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final progress = (stepNumber * 100) / 7;

    return Scaffold(
      appBar: AppBar(
          // title: Text(_steps[_currentStep].toString()),
          ),
      body:  PageTransitionSwitcher(
        duration: const Duration(milliseconds: 600),
        reverse:
        context.locale.languageCode == 'ar' ? !isReverse : isReverse,
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
      bottomNavigationBar: AddPropertyBottomNavigator(onPressedBack: _goToPrevStep,onPressedNext: _goToNextStep,progress: progress,),
    );
  }
}
