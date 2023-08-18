import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';

import '../../../../../data/models/special_attributes.dart';
import 'one_attribute.dart';

class ResidentialTypesWidget extends StatelessWidget {
  ResidentialTypesWidget(
      {required this.residentialPropertyAttributes, Key? key})
      : super(key: key);
  ResidentialPropertyAttributes residentialPropertyAttributes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OneAttributeWidget(
          name: "Bath Rooms",
          value: residentialPropertyAttributes.numberOfBathrooms,
          onTapMinus: () {
            int newValue = residentialPropertyAttributes.numberOfBathrooms;
            if (residentialPropertyAttributes.numberOfBathrooms > 0) {
              newValue = residentialPropertyAttributes.numberOfBathrooms - 1;
            }
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: residentialPropertyAttributes.copyWith(
                        numberOfBathrooms: newValue)));
          },
          onTapPlus: () {
            int newValue = residentialPropertyAttributes.numberOfBathrooms + 1;
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: residentialPropertyAttributes.copyWith(
                        numberOfBathrooms: newValue)));
          },
        ),
        OneAttributeWidget(
          name: "Balconies",
          value: residentialPropertyAttributes.numberOfBalconies,
          onTapMinus: () {
            int newValue = residentialPropertyAttributes.numberOfBalconies;
            if (newValue > 0) {
              newValue = residentialPropertyAttributes.numberOfBalconies - 1;
            }
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: residentialPropertyAttributes.copyWith(
                        numberOfBalconies: newValue)));
          },
          onTapPlus: () {
            int newValue = residentialPropertyAttributes.numberOfBalconies + 1;
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: residentialPropertyAttributes.copyWith(
                        numberOfBalconies: newValue)));
          },
        ),
        OneAttributeWidget(
          name: "Bed Rooms",
          value: residentialPropertyAttributes.numberOfBedrooms,
          onTapMinus: () {
            int newValue = residentialPropertyAttributes.numberOfBedrooms;
            if (newValue > 0) {
              newValue = residentialPropertyAttributes.numberOfBedrooms - 1;
            }
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: residentialPropertyAttributes.copyWith(
                        numberOfBedrooms: newValue)));
          },
          onTapPlus: () {
            int newValue = residentialPropertyAttributes.numberOfBedrooms + 1;
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: residentialPropertyAttributes.copyWith(
                        numberOfBedrooms: newValue)));
          },
        ),
        OneAttributeWidget(
          name: "Living Rooms",
          value: residentialPropertyAttributes.numberOfLivingRooms,
          onTapMinus: () {
            int newValue =
                residentialPropertyAttributes.numberOfLivingRooms;
            if(newValue > 0){
              int newValue =
                  residentialPropertyAttributes.numberOfLivingRooms-1;
            }
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: residentialPropertyAttributes.copyWith(
                        numberOfLivingRooms: newValue)));
          },
          onTapPlus: () {
            int newValue =
                residentialPropertyAttributes.numberOfLivingRooms + 1;
            context.read<AddPropertyBloc>().add(
                SelectedTypeConstAttributesEvent(
                    propertyAttributes: residentialPropertyAttributes.copyWith(
                        numberOfLivingRooms: newValue)));
          },
        ),
      ],
    );
  }
}
