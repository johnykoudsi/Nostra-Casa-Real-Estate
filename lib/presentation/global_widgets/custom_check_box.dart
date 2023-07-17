import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';


class CustomCheckbox extends StatelessWidget {


  late  bool? value;
  final Function(bool?) onChange;
  final String text;


  CustomCheckbox({this.value=false ,required this.onChange,required this.text});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(text),
      value: value, onChanged: onChange,
      side: const BorderSide(color: AppStyle.kGreyColor,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.5),
      ),

      activeColor: AppStyle.mainColor,
    );
  }
}


