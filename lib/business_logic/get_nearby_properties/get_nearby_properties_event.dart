part of 'get_nearby_properties_bloc.dart';

abstract class GetNearbyPropertiesEvent extends Equatable {
  const GetNearbyPropertiesEvent();
}

class GetNearbyMapsEvent extends GetNearbyPropertiesEvent {
  GetNearbyMapsEvent({required this.center, this.propertyType = PropertyType.all});
  LatLng center;
  PropertyType? propertyType;

  GetNearbyMapsEvent copyWith({
    LatLng? center,
    PropertyType? propertyType,
  }) =>
      GetNearbyMapsEvent(
        center: center ?? this.center,
        propertyType: propertyType ?? this.propertyType,
      );

  @override
  List<Object?> get props => [center, propertyType];
}
