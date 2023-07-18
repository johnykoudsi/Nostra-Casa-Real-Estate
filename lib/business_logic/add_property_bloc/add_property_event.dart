part of 'add_property_bloc.dart';

abstract class AddPropertyEvent extends Equatable {
  const AddPropertyEvent();
}
class SelectPropertyTypeEvent extends AddPropertyEvent{

  SelectPropertyTypeEvent({required this.propertyType});
  PropertyType propertyType;
  @override
  List<Object?> get props => [propertyType];
}
class SelectServiceTypeEvent extends AddPropertyEvent{

  SelectServiceTypeEvent({required this.propertyService});
  PropertyService propertyService;
  @override
  List<Object?> get props => [propertyService];
}
class SelectLocationEvent extends AddPropertyEvent{

  SelectLocationEvent({required this.latLng});
  LatLng latLng;
  @override
  List<Object?> get props => [latLng];
}
