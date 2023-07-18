part of 'google_maps_bloc.dart';

abstract class GoogleMapsEvent extends Equatable {
  const GoogleMapsEvent();
}

class GoogleAddPinEvent extends GoogleMapsEvent {
  GoogleAddPinEvent({required this.latLng});
  LatLng latLng;
  @override
  List<Object?> get props => [latLng];
}

class GoogleRemovePinEvent extends GoogleMapsEvent {
  @override
  List<Object?> get props => [];
}
