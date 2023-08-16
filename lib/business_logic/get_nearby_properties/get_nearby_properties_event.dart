part of 'get_nearby_properties_bloc.dart';

abstract class GetNearbyPropertiesEvent extends Equatable {
  const GetNearbyPropertiesEvent();
}

class GetNearbyMapsEvent extends GetNearbyPropertiesEvent {
  GetNearbyMapsEvent({required this.center, this.propertyType = PropertyType.all,this.propertyService = PropertyService.all});
  LatLng center;
  PropertyType propertyType;
  PropertyService propertyService;

  GetNearbyMapsEvent copyWith({
    LatLng? center,
    PropertyType? propertyType,
    PropertyService? propertyService,
  }) =>
      GetNearbyMapsEvent(
        center: center ?? this.center,
        propertyType: propertyType ?? this.propertyType,
        propertyService: propertyService ?? this.propertyService,
      );

  @override
  List<Object?> get props => [center, propertyType,propertyService];
}
