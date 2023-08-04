part of 'get_bloc.dart';

abstract class GetState extends Equatable {
  const GetState();
}

class GetInitialState extends GetState {
  @override
  List<Object> get props => [];
}
class GetLoadingState extends GetState {
  @override
  List<Object> get props => [];
}

class GetPropertiesState extends GetState {

  GetPropertiesState({required this.properties});

  List<Properties> properties;

  @override
  List<Object> get props => [properties];
}

class GetErrorState extends GetState {

  GetErrorState({required this.servicesResponseStatues,required this.error});
  ServicesResponseStatues servicesResponseStatues;
  String error;
  @override
  List<Object> get props => [servicesResponseStatues,error];
}
