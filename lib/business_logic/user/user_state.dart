part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}
class UserInit extends UserState {
  @override
  List<Object> get props => [];
}
class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoggedState extends UserState {
  UserLoggedState({required this.user});
  UserModel user;
  @override
  List<Object> get props => [user];
}

class UserNotLoggedState extends UserState {
  @override
  List<Object> get props => [];
}
class UserErrorState extends UserState {
  UserErrorState({required this.helperResponse});
  HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}


