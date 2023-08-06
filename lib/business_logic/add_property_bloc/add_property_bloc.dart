import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nostra_casa/data/models/special_attributes.dart';
import '../../data/models/amenities_model.dart';
import '../../data/models/tags_model.dart';
import '../../utility/enums.dart';

part 'add_property_event.dart';

part 'add_property_state.dart';

class AddPropertyBloc extends Bloc<AddPropertyEvent, AddPropertyState> {
  AddPropertyBloc() : super(AddPropertyState()) {
    on<SelectPropertyTypeEvent>((event, emit) {
      PropertyAttributes propertyAttributes ;

      if (event.propertyType == PropertyType.residential) {
        propertyAttributes = ResidentialPropertyAttributes();
      }
      if (event.propertyType ==
          PropertyType.agricultural) {
        propertyAttributes = AgriculturalPropertyAttributes();
      }
      else{
        propertyAttributes = CommercialPropertyAttributes();
      }

      emit(state.copyWith(
          selectedPropertyType: event.propertyType,
          propertyAttributes: propertyAttributes,
          propertyTypeSpecialAttributes: null,
      ));

    });

    on<SelectServiceTypeEvent>((event, emit) {
      emit(state.copyWith(propertyService: event.propertyService));
    });
    on<SelectLocationEvent>((event, emit) {
      emit(state.copyWith(selectedLocation: event.latLng));
    });
    on<SelectedImagesEvent>((event, emit) {
      emit(state.copyWith(images: List.of(event.images!.toList())));
    });
    on<SelectedTypeConstAttributesEvent>((event, emit) {
      emit(state.copyWith(
          propertyAttributes: event.propertyAttributes
      ));
    });
    on<SelectedTypeSpecialAttributesEvent>((event, emit) {
      emit(state.copyWith(
          propertyTypeSpecialAttributes: event.propertyTypeSpecialAttributes));
    });
    on<SelectRegionEvent>((event, emit) {
      emit(state.copyWith(region: event.region));
    });
    on<PropertyTitle>((event, emit) {
      emit(state.copyWith(title: event.title));
    });
    on<PropertyDescription>((event, emit) {
      emit(state.copyWith(description: event.description));
    });
    on<PropertyPrice>((event, emit) {
      emit(state.copyWith(price: event.price));
    });
    on<PropertyArea>((event, emit) {
      emit(state.copyWith(area: event.area));
    });
    on<OnAmenityItemPressEvent>((event, emit) {
      List<Amenity> selectedAmenity = [];
      selectedAmenity = List.of(state.selectedAmenity.toList());
      if (selectedAmenity.contains(event.amenity)) {
        selectedAmenity.removeWhere((element) => element == event.amenity);
      } else {
        selectedAmenity.add(event.amenity);
      }
      emit(state.copyWith(selectedAmenity: List.of(selectedAmenity.toList())));
    });
    on<OnTagItemPressEvent>((event, emit) {
      List<Tag> selectedTag = [];
      selectedTag = List.of(state.selectedTag.toList());
      if (selectedTag.contains(event.tag)) {
        selectedTag.removeWhere((element) => element == event.tag);
      } else {
        selectedTag.add(event.tag);
      }
      emit(state.copyWith(selectedTag: List.of(selectedTag.toList())));
    });
  }
}
