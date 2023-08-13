import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/services/add_favorite_service.dart';

part 'add_favorite_event.dart';
part 'add_favorite_state.dart';

class OnePropertyBloc extends Bloc<OnePropertyEvent, OnePropertyState> {
  OnePropertyBloc() : super(OnePropertyLoadingState()) {
    on<GetPropertyFavouriteEvent>((event, emit) async {
      emit(OnePropertyLoadingState());

      final favouriteState =
          await AddToFavoriteServices.getAmenityService(event: event);
      print(favouriteState);
      if (favouriteState is bool) {
        emit(OnePropertyDoneState(favouriteState: favouriteState));
      } else {
        emit(OnePropertyErrorState(error: favouriteState));
      }
    });
    on<ToggleFavouriteEvent>((event, emit) async {
      emit(OnePropertyLoadingState());
      final favouriteState =
          await AddToFavoriteServices.toggleFavouriteService(event: event);
      print(favouriteState);

      if (favouriteState is bool) {
        emit(OnePropertyDoneState(favouriteState: favouriteState));
      } else {
        emit(OnePropertyErrorState(error: favouriteState));
      }
    });
  }
}
