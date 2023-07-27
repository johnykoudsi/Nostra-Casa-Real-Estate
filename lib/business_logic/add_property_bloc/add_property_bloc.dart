import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/models/amenities_model.dart';

part 'add_property_event.dart';
part 'add_property_state.dart';

class AddPropertyBloc extends Bloc<AddPropertyEvent, AddPropertyState> {
  AddPropertyBloc() : super(AddPropertyState()) {

    on<SelectPropertyTypeEvent>((event, emit) {
      emit(state.copyWith(selectedPropertyType: event.propertyType));
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
      emit(state.copyWith(propertyTypeConstAttributes: event.propertyTypeConstAttributes));
    });
    on<SelectedTypeSpecialAttributesEvent>((event, emit) {
      emit(state.copyWith(propertyTypeSpecialAttributes: event.propertyTypeSpecialAttributes));
    });
    on<SelectRegionEvent>((event, emit) {
      emit(state.copyWith(region: event.region));
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
  }
}
