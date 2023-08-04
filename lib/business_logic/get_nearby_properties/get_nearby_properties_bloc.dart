import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nostra_casa/data/models/properties_model.dart';
import 'package:nostra_casa/data/services/maps_services.dart';
import 'package:nostra_casa/utility/network_helper.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../utility/enums.dart';

part 'get_nearby_properties_event.dart';
part 'get_nearby_properties_state.dart';

class GetNearbyPropertiesBloc extends Bloc<GetNearbyPropertiesEvent, GetNearbyPropertiesState> {
  GetNearbyPropertiesBloc() : super(GetLoadingState(),) {

    on<GetNearbyPropertiesEvent>((event, emit) async {

      emit(GetLoadingState());

      var getRequest;

      // get the request
      if (event is GetNearbyMapsEvent) {
        getRequest = await MapsServices.getNearbyPlacesService(event: event);
      }


      // casting and emit
      if (getRequest is List<Properties>) {
        emit(GetNearbyPropertiesDoneState(properties: getRequest));
      }

      if (getRequest is HelperResponse) {
        emit(GetNearbyPropertiesErrorState(
            servicesResponseStatues: getRequest.servicesResponse,
            error: getRequest.response));
      }

    },
        // drop previous events
        transformer: restartable()
    );

  }
}
