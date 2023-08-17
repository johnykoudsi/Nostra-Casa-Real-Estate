import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nostra_casa/utility/network_helper.dart';
import '../../data/services/add_favorite_service.dart';

part 'add_favorite_event.dart';
part 'add_favorite_state.dart';

class OnePropertyBloc extends Bloc<OnePropertyEvent, OnePropertyState> {
  OnePropertyBloc() : super(OnePropertyLoadingState()) {
    on<GetPropertyFavouriteEvent>((event, emit) async {
      emit(OnePropertyLoadingState());

      final favouriteState =
          await AddToFavoriteServices.getAmenityService(event: event);
      if (favouriteState is bool) {
        emit(OnePropertyDoneState(favouriteState: favouriteState));
      } else {
        emit(OnePropertyErrorState(helperResponse: favouriteState));
      }
    });
    on<ToggleFavouriteEvent>((event, emit) async {
      emit(OnePropertyLoadingState());
      final favouriteState =
          await AddToFavoriteServices.toggleFavouriteService(event: event);

      if (favouriteState is bool) {
        if(favouriteState == true){
         FirebaseMessaging.instance.subscribeToTopic("Property${event.productObjectId}");
        }else{
          await FirebaseMessaging.instance.unsubscribeFromTopic("Property${event.productObjectId}");
        }
        emit(OnePropertyDoneState(favouriteState: favouriteState));
      } else {
        emit(OnePropertyErrorState(helperResponse: favouriteState));
      }
    });
  }
}
