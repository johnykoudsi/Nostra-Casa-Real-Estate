import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/add_property/widgets/attributes_list.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';

import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_style.dart';
import '../../global_widgets/dialogs_widgets/dialogs_yes_no.dart';

class ChoosePropertyTypeAttributes extends StatefulWidget {
  const ChoosePropertyTypeAttributes({Key? key}) : super(key: key);

  @override
  State<ChoosePropertyTypeAttributes> createState() =>
      _ChoosePropertyTypeAttributesState();
}

class _ChoosePropertyTypeAttributesState
    extends State<ChoosePropertyTypeAttributes> {
  static final GlobalKey<FormState> validationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Map<String, int>? propertyTypeConstAttributes = {
      'none': 0,
    };

    final addPropertyBloc = context.watch<AddPropertyBloc>();

    if (addPropertyBloc.state.selectedPropertyType ==
        PropertyType.residential) {
      propertyTypeConstAttributes = {
        "Bathrooms".tr(): 2,
        "Bedrooms".tr(): 6,
        "Balconies".tr(): 2,
        "Living rooms".tr(): 3,
        "Floor": 2
      };
    } else if (addPropertyBloc.state.selectedPropertyType ==
        PropertyType.agricultural) {
      propertyTypeConstAttributes = {
        "Livestock inventory".tr(): 25,
        "Water usage (by liter)".tr(): 100,
        "Fertilizer usage (by pound)".tr(): 15,
      };
    } else if (addPropertyBloc.state.selectedPropertyType ==
        PropertyType.commercial) {
      propertyTypeConstAttributes = {
        "Bathrooms".tr(): 2,
        "Balconies".tr(): 2,
        "Floor".tr(): 1
      };
    }
    if (addPropertyBloc.state.propertyTypeConstAttributes != null) {
      propertyTypeConstAttributes =
          addPropertyBloc.state.propertyTypeConstAttributes;
    }
    TextEditingController newSpecialAttributeName = TextEditingController();
    TextEditingController newSpecialAttributeNumber = TextEditingController();
    addPropertySpecialTypeAttribute() {
      if (validationKey.currentState!.validate()) {
        setState(() {
          if (propertyTypeConstAttributes!
              .containsKey(newSpecialAttributeName.text)) {
            DialogsWidgetsYesNo.alreadyExistDialog(
                context, newSpecialAttributeName.text);
          } else if (addPropertyBloc.state.propertyTypeSpecialAttributes ==
              null) {
            addPropertyBloc.state.propertyTypeSpecialAttributes = {
              newSpecialAttributeName.text:
                  int.parse(newSpecialAttributeNumber.text)
            };
          } else if (addPropertyBloc.state.propertyTypeSpecialAttributes!
              .containsKey(newSpecialAttributeName.text)) {
            DialogsWidgetsYesNo.alreadyExistDialog(
                context, newSpecialAttributeName.text);
          } else {
            addPropertyBloc.state.propertyTypeSpecialAttributes![
                    newSpecialAttributeName.text] =
                int.parse(newSpecialAttributeNumber.text);
            Navigator.of(context).pop();
          }
        });
      }
    }

    Future<bool> showAddPropertyTypeAttributeDialog() async {
      return DialogsWidgetsYesNo.textFieldDialog(
          key: validationKey,
          operationName: "Add".tr(),
          context: context,
          attributeNameController: newSpecialAttributeName,
          attributeNumberController: newSpecialAttributeNumber,
          changePropertyAttribute: addPropertySpecialTypeAttribute,
          enable: true);
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Share some basics about your place'.tr(),
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            SizedBox(
              width: screenWidth,
              child: Text(
                'You\'ll add more details later'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: AppStyle.kGreyColor),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Expanded(
              child: AttributesList(
                propertyTypeAttributes: propertyTypeConstAttributes,
                enableDelete: false,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Visibility(
              visible:
                  addPropertyBloc.state.propertyTypeSpecialAttributes != null,
              child: Expanded(
                child: AttributesList(
                  propertyTypeAttributes:
                      addPropertyBloc.state.propertyTypeSpecialAttributes,
                  enableDelete: true,
                ),
              ),
            ),
            RoundedElevatedButton(
              iconData: Icons.add,
              size: 50,
              iconSize: 40,
              onTap: showAddPropertyTypeAttributeDialog,
            ),
          ],
        ),
      ),
      // bottomSheet:
    );
  }
}
