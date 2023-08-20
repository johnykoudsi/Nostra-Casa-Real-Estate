part of 'my_rating_bloc.dart';

abstract class MyRatingState extends Equatable {
  const MyRatingState();
}
class MyRatingLoading extends MyRatingState {
  @override
  List<Object> get props => [];
}
class MyRatingDone extends MyRatingState {
  MyRatingDone({this.propertyReviewsModel});
  PropertyReviewsModel? propertyReviewsModel;
  @override
  List<Object> get props => [propertyReviewsModel??"null"];
}
class MyRatingErrorStatus extends MyRatingState {
  MyRatingErrorStatus({required this.helperResponse});
  HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}