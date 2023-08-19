part of 'my_rating_bloc.dart';

abstract class MyRatingState extends Equatable {
  const MyRatingState();
}

class MyRatingInitial extends MyRatingState {
  @override
  List<Object> get props => [];
}
class MyRatingLoading extends MyRatingState {
  @override
  List<Object> get props => [];
}
class MyRatingDone extends MyRatingState {
  MyRatingDone({required this.isRated});
  bool isRated;
  @override
  List<Object> get props => [];
}
class MyRatingErrorStatus extends MyRatingState {
  MyRatingErrorStatus({required this.helperResponse});
  HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse];
}