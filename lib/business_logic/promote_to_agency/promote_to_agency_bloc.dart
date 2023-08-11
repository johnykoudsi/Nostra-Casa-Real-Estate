import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'promote_to_agency_event.dart';
part 'promote_to_agency_state.dart';

class PromoteToAgencyBloc extends Bloc<PromoteToAgencyEvent, PromoteToAgencyState> {
  PromoteToAgencyBloc() : super(PromoteToAgencyState()) {
    on<AgencyLocationEvent>((event, emit) {
      emit(state.copyWith(selectedLocation: event.latLng));
    });
  }
}
