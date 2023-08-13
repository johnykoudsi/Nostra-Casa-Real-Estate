import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../utility/app_style.dart';

class CustomInsertNumberField extends StatefulWidget {
  CustomInsertNumberField({
    Key? key,
    required this.onChange,
    this.unit,
    this.additionalText,
    this.label,
    required this.value,
  }) : super(key: key);

  Function(String value)? onChange;
  num value;
  String? unit;
  String? additionalText;
  String? label;

  @override
  State<CustomInsertNumberField> createState() =>
      _CustomInsertNumberFieldState();
}

class _CustomInsertNumberFieldState extends State<CustomInsertNumberField> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.value.toString());
    super.initState();
  }

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
            widget.label ?? '',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // RoundedElevatedButton(
              //   iconData: Icons.remove,
              //   backgroundColor: AppStyle.kLightGrey,
              //   onTap: () {
              //     widget.decrease();
              //     controller.text = widget.value.toString();
              //   },
              // ),
              const SizedBox(width: 18,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: AppStyle.k15BorderRadius,
                    color: AppStyle.kBackGroundColor,
                    border: Border.all(
                      color: AppStyle.kGreyColor,
                    ),
                  ),
                  child: TextFormField(
                    // inputFormatters: <TextInputFormatter>[
                    //   FilteringTextInputFormatter.digitsOnly,
                    // ],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: widget.onChange,
                    controller: controller,
                    cursorColor: AppStyle.blackColor,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 18,),

              // RoundedElevatedButton(
              //   iconData: Icons.add,
              //   backgroundColor: AppStyle.kLightGrey,
              //   onTap: () {
              //     widget.increase();
              //     controller.text = widget.value.toString();
              //   },
              // ),
            ],
          ),
          Text(widget.unit ?? ""),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Text(
            widget.additionalText == null
                ? ""
                : widget.additionalText.toString(),
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
