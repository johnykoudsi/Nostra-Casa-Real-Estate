part of 'get_bloc.dart';

abstract class GetEvent extends Equatable {
  const GetEvent();
}

class GetNearbyMapsEvent extends GetEvent {
  GetNearbyMapsEvent({required this.center});
  LatLng center;

  @override
  List<Object?> get props => [center];
}
