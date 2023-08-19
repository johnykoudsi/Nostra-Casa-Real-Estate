import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/property_reviews_model.dart';
import '../../data/services/get_property_reviews_service.dart';
import '../../utility/constant_logic_validations.dart';
import '../../utility/network_helper.dart';

part 'get_property_reviews_event.dart';

part 'get_property_reviews_state.dart';

class GetPropertyReviewsBloc
    extends Bloc<GetPropertyReviewsEvent, GetPropertyReviewsState> {
  GetPropertyReviewsBloc() : super(GetPropertyReviewsInitial()) {
    GetPropertyReviewsService propertyReviewsService =
        GetPropertyReviewsService();

    on<GetPropertyReviewsApiEvent>((event, emit) async {
      final currentState = state;

      if (currentState is GetPropertyReviewsLoadedState &&
          currentState.hasReachedMax) {
        return;
      }

      int getPage() {
        if (currentState is GetPropertyReviewsLoadedState) {
          return currentState.propertyReviews.length ~/ kProductsGetLimit + 1;
        }
        return 0;
      }

      var getReviews;

      event.reviewsSearchFilter.page = getPage();

      getReviews = await propertyReviewsService.getReviewsService(
        event: event,
      );

      if (getReviews is List<PropertyReviewsModel>) {
        if (getReviews.isNotEmpty) {
          // copy previous state
          if (currentState is GetPropertyReviewsLoadedState) {
            emit(currentState.copyWith(
                propertyReviews: List.of(currentState.propertyReviews)
                  ..addAll(getReviews),
                hasReachedMax:
                    getReviews.length < kProductsGetLimit ? true : false));
          }

          // add loaded state
          else {
            emit(GetPropertyReviewsLoadedState(
              propertyReviews: getReviews,
              hasReachedMax:
                  getReviews.length < kProductsGetLimit ? true : false,
            ));
          }
        } else {
          // done loading
          if (currentState is GetPropertyReviewsLoadedState) {
            emit(currentState.copyWith(hasReachedMax: true));
          }
          // done but nothing is there
          else {
            emit(GetPropertyReviewsLoadedState(
              propertyReviews: getReviews,
              hasReachedMax: true,
            ));
          }
        }
      } else {
        print("Server ${(getReviews as HelperResponse).response}");

        emit(GetPropertyReviewsErrorState(helperResponse: getReviews));
      }
    });

    on<ChangeToLoadingReviewsApiEvent>((event, emit) async {
      emit(GetPropertyReviewsInitial());
      add(GetPropertyReviewsApiEvent(
          propertyId: event.propertyId, reviewsSearchFilter: ReviewsSearchFilter(page: 1)));
    });
  }
}
