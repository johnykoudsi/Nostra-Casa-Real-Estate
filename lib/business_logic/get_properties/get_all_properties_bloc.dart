import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/data/models/properties_model.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:nostra_casa/utility/enums.dart';

import '../../data/services/get_all_property_service.dart';
import '../../utility/constant_logic_validations.dart';
import '../../utility/network_helper.dart';
import 'get_all-properties_search_filter.dart';

part 'get_all_properties_event.dart';
part 'get_all_properties_state.dart';

class GetAllPropertiesBloc
    extends Bloc<GetAllPropertiesEvent, GetAllPropertiesState> {
  GetAllPropertiesBloc() : super(AllPropertiesInitial()) {
    on<GetAllPropertiesApiEvent>(
      (event, emit) async {
        final currentState = state;
        if (currentState is AllPropertiesLoadedState &&
            currentState.hasReachedMax) {
          return;
        }

        int getPage() {
          if (currentState is AllPropertiesLoadedState) {
            return currentState.properties.length ~/ kProductsGetLimit + 1;
          }
          return 0;
        }

        var getAllProperties;

        event.searchFilterProperties.page = getPage();

        getAllProperties =
            await AllPropertiesService.getAllPropertiesService(event: event);

        if (getAllProperties is List<Property>) {
          if (getAllProperties.isNotEmpty) {
            // copy previous state
            if (currentState is AllPropertiesLoadedState) {
              emit(currentState.copyWith(
                  properties: List.of(currentState.properties)
                    ..addAll(getAllProperties),
                  hasReachedMax: getAllProperties.length < kProductsGetLimit
                      ? true
                      : false));
            }

            // add loaded state
            else {
              emit(AllPropertiesLoadedState(
                properties: getAllProperties,
                hasReachedMax:
                    getAllProperties.length < kProductsGetLimit ? true : false,
              ));
            }
          } else {
            // done loading
            if (currentState is AllPropertiesLoadedState) {
              emit(currentState.copyWith(hasReachedMax: true));
            }
            // done but nothing is there
            else {
              emit(AllPropertiesLoadedState(
                properties: getAllProperties,
                hasReachedMax: true,
              ));
            }
          }
        } else {
          print("Server ${(getAllProperties as HelperResponse).response}");

          emit(AllPropertiesErrorState(helperResponse: getAllProperties));
        }
      },
      transformer: restartable(),
    );

    on<ChangeToLoadingApiEvent>(
      (event, emit) async {
        emit(AllPropertiesInitial());

        add(GetAllPropertiesApiEvent(
            searchFilterProperties:
                event.searchFilterProperties.copyWith(page: 1)));
      },
      transformer: restartable(),
    );
  }
}
