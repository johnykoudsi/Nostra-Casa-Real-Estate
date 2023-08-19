part of 'my_rating_bloc.dart';

abstract class MyRatingEvent extends Equatable {
  const MyRatingEvent();
}
class GetMyRatingApiEvent extends MyRatingEvent {
  GetMyRatingApiEvent(
      {required this.propertyId});

  int propertyId;

  @override
  List<Object?> get props => [propertyId];
}