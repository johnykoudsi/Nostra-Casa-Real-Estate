import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  }
}
