part of 'add_property_bloc.dart';

abstract class AddPropertyEvent extends Equatable {
  const AddPropertyEvent();
  Map<String, dynamic> toJson() => {

  };
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
class SelectRegionEvent extends AddPropertyEvent{

  SelectRegionEvent({required this.region});
  String region;
  @override
  List<Object?> get props => [region];
}
class SelectLocationEvent extends AddPropertyEvent{

  SelectLocationEvent({required this.latLng});
  LatLng latLng;
  @override
  List<Object?> get props => [latLng];
}
class SelectedImagesEvent extends AddPropertyEvent{
  SelectedImagesEvent({required this.images});
  List<File>? images;
  @override
  List<Object?> get props => [images];
}
class SelectedTypeConstAttributesEvent extends AddPropertyEvent{
  SelectedTypeConstAttributesEvent({required this.propertyTypeConstAttributes});
  Map<String,int>? propertyTypeConstAttributes;
  @override
  List<Object?> get props => [propertyTypeConstAttributes];
}
class SelectedTypeSpecialAttributesEvent extends AddPropertyEvent{
  SelectedTypeSpecialAttributesEvent({required this.propertyTypeSpecialAttributes});
  Map<String,int>? propertyTypeSpecialAttributes;
  @override
  List<Object?> get props => [propertyTypeSpecialAttributes];
}
class OnAmenityItemPressEvent extends AddPropertyEvent {
  OnAmenityItemPressEvent({required this.amenity});
  Amenity amenity;
  @override
  List<Object?> get props => [amenity];
}

