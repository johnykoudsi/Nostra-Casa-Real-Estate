part of 'edit_user_bloc.dart';

abstract class EditUserState extends Equatable {
  const EditUserState();
}

class EditUserInitial extends EditUserState {
  @override
  List<Object> get props => [];
}

class EditUserLoadingState extends EditUserState {

  @override
  List<Object> get props => [];
}

class EditUserStatusState extends EditUserState {
  EditUserStatusState({required this.helperResponse});
  HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}