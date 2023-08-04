import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nostra_casa/data/models/GetRequestModel.dart';
import 'package:nostra_casa/data/models/properties_model.dart';
import 'package:nostra_casa/data/services/maps_services.dart';
import 'package:nostra_casa/utility/network_helper.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../utility/enums.dart';

part 'get_event.dart';
part 'get_state.dart';

class GetBloc extends Bloc<GetEvent, GetState> {
  GetBloc() : super(GetLoadingState(),) {

    on<GetEvent>((event, emit) async {

      emit(GetLoadingState());

      var getRequest;

      // get the request
      if (event is GetNearbyMapsEvent) {
        getRequest = await MapsServices.getNearbyPlacesService(event: event);
      }


      // casting and emit
      if (getRequest is List<Properties>) {
        emit(GetPropertiesState(properties: getRequest));
      }

      if (getRequest is HelperResponse) {
        emit(GetErrorState(
            servicesResponseStatues: getRequest.servicesResponse,
            error: getRequest.response));
      }

    },
        // drop previous events
        transformer: restartable()
    );

  }
}
