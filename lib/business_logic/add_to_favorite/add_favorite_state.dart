part of 'add_favorite_bloc.dart';

abstract class OnePropertyState extends Equatable {
  const OnePropertyState();
}
class OnePropertyLoadingState extends OnePropertyState {
  @override
  List<Object> get props => [];
}

class OnePropertyDoneState extends OnePropertyState {


  OnePropertyDoneState({required this.favouriteState});
  bool favouriteState;
  @override
  List<Object> get props => [favouriteState];
}

class OnePropertyErrorState extends OnePropertyState {


  OnePropertyErrorState({required this.helperResponse});
  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse];
}
