import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';

import '../../../utility/app_style.dart';

class CustomInsertNumberField extends StatelessWidget {
  CustomInsertNumberField(
      {Key? key,
      required this.decrease,
      required this.increase,
      required this.controller,
      this.unit,
      this.additionalText,
        this.label,
      this.hintText})
      : super(key: key);
  Function() decrease;
  Function() increase;
  TextEditingController controller = TextEditingController();
  String? unit;
  String? additionalText;
  String? hintText;
  String? label;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        color: AppStyle.kLightGrey,
        borderRadius: AppStyle.k15BorderRadius,
        border: Border.all(
          color: AppStyle.kGreyColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label ?? '',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedElevatedButton(
                iconData: Icons.remove,
                backgroundColor: AppStyle.kLightGrey,
                onTap: () {
                  decrease();
                },
              ),
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
                    decoration: InputDecoration(
                      hintText: hintText,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: controller,
                    cursorColor: AppStyle.blackColor,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              RoundedElevatedButton(
                iconData: Icons.add,
                backgroundColor: AppStyle.kLightGrey,
                onTap: () {
                  increase();
                },
              ),
            ],
          ),
          Text(unit ?? ""),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Text(
            additionalText == null ? "" : additionalText.toString(),
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
