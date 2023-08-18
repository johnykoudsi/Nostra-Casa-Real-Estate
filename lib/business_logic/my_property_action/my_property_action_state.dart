part of 'my_property_action_bloc.dart';

abstract class MyPropertyActionState extends Equatable {
  const MyPropertyActionState();
}

class MyPropertyActionInitial extends MyPropertyActionState {
  @override
  List<Object> get props => [];
}
class MyPropertyActionLoading extends MyPropertyActionState {
  @override
  List<Object> get props => [];
}
class MyPropertyActionStatus extends MyPropertyActionState {
  MyPropertyActionStatus({required this.helperResponse});
  HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse];
}
