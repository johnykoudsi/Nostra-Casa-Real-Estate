import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_style.dart';
import '../../global_widgets/phone_number_field.dart';

class CustomInsertText extends StatelessWidget {
  CustomInsertText(
      {Key? key, required this.controller, this.additionalText, this.hintText})
      : super(key: key);
  TextEditingController controller = TextEditingController();
  String? additionalText;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    final addPropertyBloc = context.watch<AddPropertyBloc>();

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.06, right: screenWidth * 0.06),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: AppStyle.k15BorderRadius,
                    color: AppStyle.kBackGroundColor,
                    border: Border.all(
                      color: AppStyle.kGreyColor,
                    ),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      //addPropertyBloc.state.region = controller.text;
                    },
                    decoration: InputDecoration(
                      hintText: hintText,
                    ),
                    controller: controller,
                    cursorColor: AppStyle.blackColor,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
