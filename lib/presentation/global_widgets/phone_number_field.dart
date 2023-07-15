import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nostra_casa/utility/app_style.dart';

class PhoneNumberField extends StatelessWidget {
  PhoneNumberField({
    required this.phoneNumberController,
    required this.onChange,
    Key? key,
  }) : super(key: key);

  TextEditingController phoneNumberController;
  Function(PhoneNumber value)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      decoration: const BoxDecoration(
        borderRadius: AppStyle.k4RadiusLowerPadding,
        color: Colors.white,
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: onChange,
        searchBoxDecoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 30),
          // hintText: "Search by country name or dial code",
          labelText: "Search by country name or dial code",
        ),
        textStyle: Theme.of(context).textTheme.headline5!.copyWith(height: 2.5),
        initialValue: PhoneNumber(isoCode: "SY"),
        keyboardAction: TextInputAction.next,
        cursorColor: AppStyle.darkBlueColor,
        textFieldController: phoneNumberController,
        selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
      ),
    );
  }
}
