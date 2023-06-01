part of 'get_bloc.dart';

abstract class GetState extends Equatable {
  const GetState();
}

class GetInitial extends GetState {
  @override
  List<Object> get props => [];
}
class GetLoading extends GetState {
  @override
  List<Object> get props => [];
}
class GetDone extends GetState {

  GetDone({required this.getRequestModel});

  GetRequestModel getRequestModel;
  @override
  List<Object> get props => [getRequestModel];
}
class GetError extends GetState {

  GetError({required this.servicesResponseStatues,required this.error});
  ServicesResponseStatues servicesResponseStatues;
  String error;
  @override
  List<Object> get props => [error,servicesResponseStatues];
}
