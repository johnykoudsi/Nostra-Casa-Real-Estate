import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/services/promote_to_agency_service.dart';
import '../../utility/endpoints.dart';
import '../../utility/network_helper.dart';

part 'promote_to_agency_event.dart';
part 'promote_to_agency_state.dart';

class PromoteToAgencyBloc extends Bloc<PromoteToAgencyEvent, PromoteToAgencyState> {
  PromoteToAgencyBloc() : super(PromoteToAgencyInitial()) {
    on<PromoteToAgencyApiEvent>((event, emit)async {
      emit(PromoteToAgencyLoading());
      HelperResponse helperResponse;


        helperResponse = await PromoteToAgencyService.promoteToAgencyService(
            endPoints: EndPoints.promoteToAgency, event: event);


      emit(PromoteToAgencyStatus(helperResponse: helperResponse));
    });
  }
}
