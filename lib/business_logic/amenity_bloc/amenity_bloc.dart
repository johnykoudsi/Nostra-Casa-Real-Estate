import 'package:bloc/bloc.dart';
import '../../data/models/amenities_model.dart';
import '../../data/services/amenity_service.dart';
import '../../utility/constant_logic_validations.dart';
import '../../utility/network_helper.dart';
part 'amenity_event.dart';
part 'amenity_state.dart';

class AmenityBloc extends Bloc<AmenityEvent, AmenityState> {
  AmenityBloc() : super(AmenityInitial()) {
    AmenityService amenityService = AmenityService();

    on<GetAmenityApiEvent>((event, emit) async {
      final currentState = state;
      if (currentState is AmenityLoadedState && currentState.hasReachedMax) {
        return;
      }

      int getPage() {
        if (currentState is AmenityLoadedState) {
          return currentState.amenities.length ~/ kProductsGetLimit + 1;
        }
        return 0;
      }

      var getAmenity;

      event.searchFilterProperties.page = getPage();

      getAmenity = await amenityService.getAmenityService(
        event: event,
      );

      if (getAmenity is List<Amenity>) {
        if (getAmenity.isNotEmpty) {
          // copy previous state
          if (currentState is AmenityLoadedState) {
            emit(currentState.copyWith(
                amenities: List.of(currentState.amenities)..addAll(getAmenity),
                hasReachedMax:
                    getAmenity.length < kProductsGetLimit ? true : false));
          }

          // add loaded state
          else {
            emit(AmenityLoadedState(
              amenities: getAmenity,
              hasReachedMax:
                  getAmenity.length < kProductsGetLimit ? true : false,
            ));
          }
        } else {
          // done loading
          if (currentState is AmenityLoadedState) {
            emit(currentState.copyWith(hasReachedMax: true));
          }
          // done but nothing is there
          else {
            emit(AmenityLoadedState(
              amenities: getAmenity,
              hasReachedMax: true,
            ));
          }
        }
      } else {
        print("Server ${(getAmenity as HelperResponse).response}");

        emit(AmenityErrorState(helperResponse: getAmenity));
      }
    });

    on<ChangeToLoadingApiEvent>((event, emit) async {
      emit(AmenityInitial());

      add(GetAmenityApiEvent(
          searchFilterProperties: AmenitiesSearchFilter(page: 1)));
    });
  }
}
