import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'google_maps_event.dart';
part 'google_maps_state.dart';

class GoogleMapsBloc extends Bloc<GoogleMapsEvent, GoogleMapsState> {
  GoogleMapsBloc() : super(GoogleMapsPinEmpty()) {

    on<GoogleAddPinEvent>((event, emit) {
      emit(GoogleMapsPinSelected(latLng: event.latLng,steps: Random().nextInt(10000000)));
    });
    on<GoogleRemovePinEvent>((event, emit) {
      emit(GoogleMapsPinEmpty());
    });

  }
}
