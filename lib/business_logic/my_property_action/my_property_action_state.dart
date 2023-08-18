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
class MyPropertyActionDone extends MyPropertyActionState {
  @override
  List<Object> get props => [];
}
class MyPropertyActionError extends MyPropertyActionState {
  @override
  List<Object> get props => [];
}
