import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/screens/add_property_images.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_amenities.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_location.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_property_type_attributes.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_service.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_tags.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_type.dart';
import 'package:nostra_casa/presentation/add_property/screens/welcome_step.dart';

class GetSelectedScreenByStepNumber extends StatelessWidget {
  const GetSelectedScreenByStepNumber({required this.stepNumber,Key? key}) : super(key: key);
  final int stepNumber ;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          if(stepNumber == 0){
            return const WelcomeStep();
          }
          if(stepNumber == 1){
            return const ChooseTags();
          }
          if(stepNumber == 2){
            return const ChooseType();
          }
          if(stepNumber == 3){
            return const ChooseService();
          }
          if(stepNumber == 4){
            return const ChoosePropertyTypeAttributes();
          }
          if(stepNumber == 5){
            return const ChooseAmenities();
          }
          if(stepNumber == 6){
            return const AddPropertyImages();
          }
          if(stepNumber == 7){
            return const ChooseLocation();
          }
          return const Scaffold(
            body: Center(
              child: Text(
                'Check Named Route',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          );
        }
    );
  }
}