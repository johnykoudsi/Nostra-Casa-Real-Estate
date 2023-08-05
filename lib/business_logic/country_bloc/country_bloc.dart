import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/data/models/country_and_city_model.dart';
import 'package:nostra_casa/data/services/country_services.dart';

import '../../utility/network_helper.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryLoadingState()) {

    on<GetCountryCityEvent>((event, emit) async {
      emit(CountryLoadingState());

      var getRequest = await CountryServices.getNearbyPlacesService(event: event);

      // casting and emit
      if (getRequest is CountryModel) {
        emit(CountryDoneState(countryModel: getRequest));
      }

      if (getRequest is HelperResponse) {
        emit(CountryErrorState(
            helperResponse: getRequest
        ));
      }

    });
  }
}
