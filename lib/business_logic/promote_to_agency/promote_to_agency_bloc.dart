import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nostra_casa/data/services/promote_to_agency_service.dart';
import 'package:nostra_casa/utility/endpoints.dart';

import '../../utility/network_helper.dart';

part 'promote_to_agency_event.dart';
part 'promote_to_agency_state.dart';

class PromoteToAgencyBloc extends Bloc<PromoteToAgencyEvent, PromoteToAgencyState> {
  PromoteToAgencyBloc() : super(PromoteToAgencyState()) {
    on<AgencyLocationEvent>((event, emit) {
      emit(state.copyWith(selectedLocation: event.latLng));
    });
    on<PromoteAgencyApiEvent>((event, emit) async {
      emit(PromoteToAgencyLoadingState());

      final response = await PromoteToAgencyService.promoteToAgencyService(endPoints: EndPoints.promoteToAgency, event: event);
              //print(response.toString());
    });
  }
}
