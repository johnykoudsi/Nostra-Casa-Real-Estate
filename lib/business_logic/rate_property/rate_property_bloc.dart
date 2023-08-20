import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/services/rate_property_service.dart';
import '../../utility/network_helper.dart';

part 'rate_property_event.dart';
part 'rate_property_state.dart';

class RatePropertyBloc extends Bloc<RatePropertyEvent, RatePropertyState> {
  RatePropertyBloc() : super(RatePropertyInitial()) {
    on<RatePropertyApiEvent>((event, emit) async {
      emit(RatePropertyLoading());

      final response =
          await RatePropertyService.ratePropertyService(event: event);

      emit(RatePropertyStatus(helperResponse: response));
    });
  }
}
