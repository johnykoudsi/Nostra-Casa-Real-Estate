import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/add_property/screens/add_property_description.dart';
import 'package:nostra_casa/presentation/add_property/screens/add_property_images.dart';
import 'package:nostra_casa/presentation/add_property/screens/add_property_price.dart';
import 'package:nostra_casa/presentation/add_property/screens/add_property_title.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_amenities.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_property_type_attributes.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_service.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_tags.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_type.dart';
import 'package:nostra_casa/presentation/add_property/screens/pin_google_map_screen/GoogleMapsScreen.dart';
import 'package:nostra_casa/presentation/add_property/widgets/add_property_bottom_navigator.dart';

import '../../business_logic/google_maps/google_maps_bloc.dart';

class AddPropertyHome extends StatefulWidget {
  const AddPropertyHome({super.key});

  @override
  AddPropertyHomeState createState() => AddPropertyHomeState();
}

class AddPropertyHomeState extends State<AddPropertyHome> {
  int screensNumber = 9;

  bool isDisabledNext() {
    if(screensNumber == stepNumber){
      return true;
    }
    return false;
  }

  bool isDisabledBack() {
    if (stepNumber == 0) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  int stepNumber = 0;
  bool isReverse = false;

  @override
  Widget build(BuildContext context) {
    final progress = (stepNumber * 100) / screensNumber;
    return BlocProvider(
      create: (context) => GoogleMapsBloc(),
      child: Scaffold(
        appBar: AppBar(),
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
          child: Builder(builder: (context) {
            if (stepNumber == 0) {
              return const ChooseTags();
            }
            if (stepNumber == 1) {
              return const ChooseType();
            }
            if (stepNumber == 2) {
              return const ChooseService();
            }
            if (stepNumber == 3) {
              return const ChoosePropertyTypeAttributes();
            }
            if (stepNumber == 4) {
              return const ChooseAmenities();
            }
            if (stepNumber == 5) {
              return const AddPropertyImages();
            }
            if (stepNumber == 6) {
              return const GoogleMapsScreen();
            }
            if (stepNumber == 7) {
              return const AddPropertyTitle();
            }
            if (stepNumber == 8) {
              return const AddPropertyDescription();
            }
            if (stepNumber == 9) {
              return const AddPropertyPrice();
            }
            return const Scaffold(
              body: Center(
                child: Text(
                  'Check Named Route',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            );
          }),
        ),
        bottomNavigationBar: BlocBuilder<GoogleMapsBloc, GoogleMapsState>(
          builder: (context, state) {
            return AddPropertyBottomNavigator(
              onPressedBack: isDisabledBack()
                  ? null : () {
                setState(() {
                  stepNumber--;
                });
              },
              onPressedNext: isDisabledNext() || (state is GoogleMapsPinEmpty && stepNumber == 6)
                  ? null
                  : () {
                setState(() {
                  stepNumber++;
                });
              },
              progress: progress,
              stepNumber: stepNumber,
            );
          },
        ),
      ),
    );
  }
}
