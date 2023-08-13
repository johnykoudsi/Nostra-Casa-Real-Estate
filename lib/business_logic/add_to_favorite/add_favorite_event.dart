part of 'add_favorite_bloc.dart';

abstract class OnePropertyEvent extends Equatable {
  const OnePropertyEvent();
}


class GetPropertyFavouriteEvent extends OnePropertyEvent{
  GetPropertyFavouriteEvent({required this.productObjectId});

  int productObjectId;
  @override
  List<Object?> get props => [productObjectId];

}


class ToggleFavouriteEvent extends OnePropertyEvent{
  ToggleFavouriteEvent({required this.productObjectId});

  int productObjectId;
  @override
  List<Object?> get props => [productObjectId];

}
