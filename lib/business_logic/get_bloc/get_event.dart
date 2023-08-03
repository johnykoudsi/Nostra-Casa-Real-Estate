part of 'get_bloc.dart';

abstract class GetEvent extends Equatable {
  const GetEvent();
}

class GetNearbyMapsEvent extends GetEvent {
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
