
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';

import '../../../../../data/models/special_attributes.dart';
import 'one_attribute.dart';

class CommercialTypesWidget extends StatelessWidget {
  CommercialTypesWidget(
      {required this.commercialPropertyAttributes, Key? key})
      : super(key: key);
  CommercialPropertyAttributes commercialPropertyAttributes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OneAttributeWidget(
          name: "Bath Rooms",
          value: commercialPropertyAttributes.numberOfBathrooms,
          onTapMinus: () {
            int newValue = commercialPropertyAttributes.numberOfBathrooms - 1;
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: commercialPropertyAttributes.copyWith(
                        numberOfBathrooms: newValue)));
          },
          onTapPlus: () {
            int newValue = commercialPropertyAttributes.numberOfBathrooms + 1;
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: commercialPropertyAttributes.copyWith(
                        numberOfBathrooms: newValue)));
          },
        ),
        OneAttributeWidget(
          name: "Balconies",
          value: commercialPropertyAttributes.numberOfBalconies,
          onTapMinus: () {
            int newValue=commercialPropertyAttributes.numberOfBalconies;
            if(commercialPropertyAttributes.numberOfBalconies>0){
               newValue = commercialPropertyAttributes.numberOfBalconies - 1;
            }
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: commercialPropertyAttributes.copyWith(
                        numberOfBalconies: newValue)));
          },
          onTapPlus: () {
            int newValue = commercialPropertyAttributes.numberOfBalconies + 1;
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: commercialPropertyAttributes.copyWith(
                        numberOfBalconies: newValue)));
          },
        ),
        OneAttributeWidget(
          name: "Floor",
          value: commercialPropertyAttributes.floor,
          onTapMinus: () {
            int newValue = commercialPropertyAttributes.floor - 1;
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: commercialPropertyAttributes.copyWith(
                        floor: newValue)));
          },
          onTapPlus: () {
            int newValue = commercialPropertyAttributes.floor + 1;
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: commercialPropertyAttributes.copyWith(
                        floor: newValue)));
          },
        ),

      ],
    );
  }
}
