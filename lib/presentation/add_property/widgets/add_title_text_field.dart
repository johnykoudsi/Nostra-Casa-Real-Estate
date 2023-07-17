import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

class AddTitleTextField extends StatelessWidget {
   AddTitleTextField({Key? key,required this.titleController}) : super(key: key);
  TextEditingController titleController;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
          borderRadius: AppStyle.k15BorderRadius,
          border: Border.all(
            width: 3,
            color: AppStyle.blackColor,
          )),
      child: TextField(
        cursorColor: AppStyle.blackColor, // set the cursor color to red
        maxLength: 32,
        buildCounter: (BuildContext context,
            {required int currentLength,
              required bool isFocused,
              required int? maxLength}) {
          return Center(
            child: Text(
                '$currentLength/$maxLength'),
          ); // display a custom character counter
        },
        controller: titleController,
        maxLines: null,
      ),
    );
  }
}
