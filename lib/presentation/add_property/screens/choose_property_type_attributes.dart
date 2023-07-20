import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/add_property/widgets/attributes_list.dart';

import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_style.dart';

class ChoosePropertyTypeAttributes extends StatefulWidget {
  const ChoosePropertyTypeAttributes({Key? key}) : super(key: key);

  @override
  State<ChoosePropertyTypeAttributes> createState() =>
      _ChoosePropertyTypeAttributesState();
}

class _ChoosePropertyTypeAttributesState
    extends State<ChoosePropertyTypeAttributes> {
  @override
  Widget build(BuildContext context) {
    Map<String, int>? propertyTypeAttributes = {
      'none': 0,
    };

    final addPropertyBloc = context.watch<AddPropertyBloc>();
    if (addPropertyBloc.state.selectedPropertyType ==
        PropertyType.residential) {
      propertyTypeAttributes = {
        "Bathrooms".tr(): 2,
        "Bedrooms".tr(): 6,
        "Balconies".tr(): 2,
        "Living rooms".tr(): 3,
        "Floor": 2
      };
    } else if (addPropertyBloc.state.selectedPropertyType ==
        PropertyType.agricultural) {
      propertyTypeAttributes = {
        "Livestock inventory".tr(): 25,
        "Water usage (by liter)".tr(): 100,
        "Fertilizer usage (by pound)".tr(): 15
      };
    } else if (addPropertyBloc.state.selectedPropertyType ==
        PropertyType.commercial) {
      propertyTypeAttributes = {
        "Bathrooms".tr(): 2,
        "Balconies".tr(): 2,
        "Floor".tr(): 1
      };
    }
    if (addPropertyBloc.state.propertyTypeAttributes != null) {
      propertyTypeAttributes = addPropertyBloc.state.propertyTypeAttributes;
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
                propertyTypeAttributes: propertyTypeAttributes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
