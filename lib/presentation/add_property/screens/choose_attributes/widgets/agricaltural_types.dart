import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/data/models/special_attributes.dart';

import '../../../../../business_logic/add_property_bloc/add_property_bloc.dart';
import 'one_attribute.dart';

class AgriculturalTypesWidget extends StatelessWidget {
  AgriculturalTypesWidget(
      {required this.agriculturalPropertyAttributes, Key? key})
      : super(key: key);
  AgriculturalPropertyAttributes agriculturalPropertyAttributes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OneAttributeWidget(
          name: "Bath Rooms",
          value: agriculturalPropertyAttributes.waterSources,
          onTapMinus: () {
            if(agriculturalPropertyAttributes.waterSources == 0){
              return;
            }
            int newValue = agriculturalPropertyAttributes.waterSources - 1;
            context
                .read<AddPropertyBloc>()
                .add(SelectedTypeConstAttributesEvent(
                  propertyAttributes:
                      AgriculturalPropertyAttributes(waterSources: newValue),
                ));
          },
          onTapPlus: () {
            int newValue = agriculturalPropertyAttributes.waterSources + 1;
            context
                .read<AddPropertyBloc>()
                .add(SelectedTypeConstAttributesEvent(
                  propertyAttributes:
                      AgriculturalPropertyAttributes(waterSources: newValue),
                ));
          },
        ),
      ],
    );
  }
}
