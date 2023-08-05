import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';
import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';
import 'package:nostra_casa/utility/app_style.dart';

class AddTitleTextField extends StatelessWidget {
  AddTitleTextField({
    Key? key,
    required this.controller,
    required this.onChange
  })
      : super(key: key);
  TextEditingController controller;
  Function(String value)? onChange;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
        return Container(
          height: screenHeight * 0.2,
          decoration: BoxDecoration(
              borderRadius: AppStyle.k15BorderRadius,
              border: Border.all(
                width: 3,
                color: AppStyle.blackColor,
              )),
          child: TextField(
            cursorColor: AppStyle.blackColor,
            // set the cursor color to red
            maxLength: 32,
            buildCounter: (BuildContext context,
                {required int currentLength,
                  required bool isFocused,
                  required int? maxLength}) {
              return Center(
                child: Text('$currentLength/$maxLength'),
              ); // display a custom character counter
            },
            controller: controller,
            onChanged: onChange,
            maxLines: null,
          ),
        );

  }
}
