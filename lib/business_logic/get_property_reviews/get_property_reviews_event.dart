part of 'get_property_reviews_bloc.dart';

abstract class GetPropertyReviewsEvent extends Equatable {
}
class GetPropertyReviewsApiEvent extends GetPropertyReviewsEvent {
  GetPropertyReviewsApiEvent(
      {required this.reviewsSearchFilter,required this.propertyId});

  ReviewsSearchFilter reviewsSearchFilter;
  int propertyId;

  @override
  List<Object?> get props => [ reviewsSearchFilter,propertyId];
}

class ChangeToLoadingReviewsApiEvent extends GetPropertyReviewsEvent {
  ChangeToLoadingReviewsApiEvent({this.reviewsSearchFilter,required this.propertyId});

  ReviewsSearchFilter? reviewsSearchFilter;
  int propertyId;

  @override
  List<Object?> get props => [reviewsSearchFilter,propertyId];
}
