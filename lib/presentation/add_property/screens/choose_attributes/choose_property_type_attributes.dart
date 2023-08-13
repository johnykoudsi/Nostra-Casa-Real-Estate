import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/data/models/special_attributes.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_attributes/widgets/agricaltural_types.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_attributes/widgets/commercial_types.dart';
import 'package:nostra_casa/presentation/add_property/screens/choose_attributes/widgets/residential_types.dart';
import '../../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../../utility/app_style.dart';
import '../../../../utility/enums.dart';

class ChoosePropertyTypeAttributes extends StatefulWidget {
  const ChoosePropertyTypeAttributes({Key? key}) : super(key: key);

  @override
  State<ChoosePropertyTypeAttributes> createState() =>
      _ChoosePropertyTypeAttributesState();
}

class _ChoosePropertyTypeAttributesState
    extends State<ChoosePropertyTypeAttributes> {
  static final GlobalKey<FormState> validationKey = GlobalKey<FormState>();

  TextEditingController newSpecialAttributeName = TextEditingController();
  TextEditingController newSpecialAttributeNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Text(
              'You\'ll add more details later'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppStyle.kGreyColor),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            BlocBuilder<AddPropertyBloc, AddPropertyState>(
              builder: (context, state) {
                final propertyAttributes = state.propertyAttributes;

                if (propertyAttributes is ResidentialPropertyAttributes) {
                  return Expanded(
                      child: ResidentialTypesWidget(
                    residentialPropertyAttributes: propertyAttributes,
                  ));
                }
                if (propertyAttributes is CommercialPropertyAttributes) {
                  return Expanded(
                      child: CommercialTypesWidget(
                    commercialPropertyAttributes: propertyAttributes,
                  ));
                }
                if (propertyAttributes is AgriculturalPropertyAttributes) {
                  return Expanded(
                      child: AgriculturalTypesWidget(
                    agriculturalPropertyAttributes: propertyAttributes,
                  ));
                }
                return const SizedBox();
              },
            ),

            // Expanded(
            //   child: ConstAttributesList(
            //    attributesNames: attributesNames,
            //    attributesValues: attributesValue,
            //     enableDelete: false,
            //   ),
            // ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            // Visibility(
            //   visible:
            //       addPropertyBloc.state.propertyTypeSpecialAttributes != null,
            //   child: Expanded(
            //     child: SpecialAttributesList(
            //       propertyTypeAttributes:
            //           addPropertyBloc.state.propertyTypeSpecialAttributes,
            //       enableDelete: true,
            //     ),
            //   ),
            // ),
            // RoundedElevatedButton(
            //   iconData: Icons.add,
            //   size: 50,
            //   iconSize: 40,
            //   onTap: showAddPropertyTypeAttributeDialog,
            // ),
          ],
        ),
      ),
      // bottomSheet:
    );
  }
}
