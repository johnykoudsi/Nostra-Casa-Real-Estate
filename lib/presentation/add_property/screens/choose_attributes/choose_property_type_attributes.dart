import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_attributes/widgets/const_attributes_list.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_attributes/widgets/special_attributes_list.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';

import '../../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../../utility/app_style.dart';
import '../../../../utility/enums.dart';
import '../../../global_widgets/dialogs_widgets/dialogs_yes_no.dart';

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
    // Map<String, int>? propertyTypeConstAttributes = {
    //   'none': 0,
    // };
    List<String> attributesNames=[];
    List<int>? attributesValue=[];
    int numberOfBathrooms=2;
    int numberOfBedrooms=4;
    int numberOfBalconies=3;
    int numberOfLivingRooms=1;
    int livestockInventory =200;
    int waterUsage=50;
    int fertilizerUsage=20;
    int floor=2;
    final addPropertyBloc = context.watch<AddPropertyBloc>();

    if (addPropertyBloc.state.selectedPropertyType ==
        PropertyType.residential) {
      attributesNames=["Bathrooms","Bedrooms","Balconies","Living rooms","Floor"];
      attributesValue=[numberOfBathrooms,numberOfBedrooms,numberOfBalconies,numberOfLivingRooms,floor];
    } else if (addPropertyBloc.state.selectedPropertyType ==
        PropertyType.agricultural) {
      attributesNames=["Livestock inventory","Water usage (by liter)","Fertilizer usage (by pound)"];
      attributesValue=[livestockInventory,waterUsage,fertilizerUsage];
    } else if (addPropertyBloc.state.selectedPropertyType ==
        PropertyType.commercial) {
      attributesNames=["Bathrooms","Balconies","Floor"];
      attributesValue=[numberOfBathrooms,numberOfBalconies,floor];

    }
    if (addPropertyBloc.state.propertyTypeConstAttributes != null) {
      attributesValue =
          addPropertyBloc.state.propertyTypeConstAttributes;
    }
    TextEditingController newSpecialAttributeName = TextEditingController();
    TextEditingController newSpecialAttributeNumber = TextEditingController();
    addPropertySpecialTypeAttribute() {
      if (validationKey.currentState!.validate()) {
        setState(() {
          if (attributesNames!
              .contains(newSpecialAttributeName.text)) {
            DialogsWidgetsYesNo.validationDialog(
                context: context, name: newSpecialAttributeName.text);
          } else if (addPropertyBloc.state.propertyTypeSpecialAttributes == null) {
            addPropertyBloc.state.propertyTypeSpecialAttributes = {
              newSpecialAttributeName.text:
                  int.parse(newSpecialAttributeNumber.text)
            };
          } else if (addPropertyBloc.state.propertyTypeSpecialAttributes!
              .containsKey(newSpecialAttributeName.text)) {
            DialogsWidgetsYesNo.validationDialog(
                context:context, name:newSpecialAttributeName.text);
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
              child: ConstAttributesList(
               attributesNames: attributesNames,
               attributesValues: attributesValue,
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
                child: SpecialAttributesList(
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
