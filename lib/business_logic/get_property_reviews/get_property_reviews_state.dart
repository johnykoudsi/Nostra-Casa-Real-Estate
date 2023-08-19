part of 'get_property_reviews_bloc.dart';

abstract class GetPropertyReviewsState  {

}

class GetPropertyReviewsInitial extends GetPropertyReviewsState {

}
class GetPropertyReviewsLoadedState extends GetPropertyReviewsState {
  List<PropertyReviewsModel> propertyReviews;
  bool hasReachedMax;

  GetPropertyReviewsLoadedState(
      {this.propertyReviews = const <PropertyReviewsModel>[],
        required this.hasReachedMax});

  GetPropertyReviewsLoadedState copyWith({
    List<PropertyReviewsModel>? propertyReviews,
    bool? hasReachedMax,
  }) {
    return GetPropertyReviewsLoadedState(
      propertyReviews: propertyReviews ?? this.propertyReviews,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [propertyReviews, hasReachedMax];
}

class GetPropertyReviewsErrorState extends GetPropertyReviewsState {
  GetPropertyReviewsErrorState({required this.helperResponse});

  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse];
}