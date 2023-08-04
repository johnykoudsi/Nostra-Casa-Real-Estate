part of 'get_nearby_properties_bloc.dart';

abstract class GetNearbyPropertiesState extends Equatable {
  const GetNearbyPropertiesState();
}

class GetNearbyPropertiesInitialState extends GetNearbyPropertiesState {
  @override
  List<Object> get props => [];
}
class GetLoadingState extends GetNearbyPropertiesState {
  @override
  List<Object> get props => [];
}

class GetNearbyPropertiesDoneState extends GetNearbyPropertiesState {

  GetNearbyPropertiesDoneState({required this.properties});

  List<Properties> properties;

  @override
  List<Object> get props => [properties];
}

class GetNearbyPropertiesErrorState extends GetNearbyPropertiesState {

  GetNearbyPropertiesErrorState({required this.helperResponse});
  HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse];
}
