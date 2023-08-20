import 'package:flutter/material.dart';

import '../../../data/models/report_categories.dart';
import '../../../utility/app_style.dart';

class DropDownListWidget extends StatelessWidget {
  DropDownListWidget(
      {
      required this.dropDownValues,
      required this.onChanged,
      required this.value,
      required this.hint,
      Key? key})
      : super(key: key);

  Function(Object?)? onChanged;
  ReportCategory? value;
  String hint;
  List<ReportCategory>? dropDownValues;
  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: AppStyle.k4RadiusLowerPadding,
        color: Colors.white,
      ),
      child: DropdownButton(
          underline: Container(),
          isExpanded: true,
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          borderRadius: AppStyle.k4RadiusLowerPadding,
          elevation: 0,
          alignment: Alignment.center,
          menuMaxHeight: 225,
          hint: Text(
            hint,
            // style: const TextStyle(
            //     fontSize: 16, fontFamily: kNormalFont, color: kGreyColor),
          ),
          //borderRadius:  BorderRadius.circular(10),
          // style: const TextStyle(
          //   color: kBlackColor,
          //   fontFamily: kBoldFont,
          // ),
          value: value,
          items: dropDownValues?.map((items) {
            return DropdownMenuItem(
              alignment: Alignment.center,
              value: items,
              child: Text(
                items.name,
                // style: TextStyle(
                //   fontSize: 3.8 * SizeConfig.blockSizeHorizontal,
                //   //color: kBlackColor,
                // ),
              ),
            );
          }).toList(),
          onChanged: onChanged),
    );
  }
}
