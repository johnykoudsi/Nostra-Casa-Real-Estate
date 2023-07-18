part of 'google_maps_bloc.dart';


abstract class GoogleMapsState extends Equatable {}

class GoogleMapsPinSelected extends GoogleMapsState{
  LatLng latLng;
  int steps;
  GoogleMapsPinSelected({required this.latLng,required this.steps});

  @override
  List<Object?> get props => [latLng,steps];

}

class GoogleMapsPinEmpty extends GoogleMapsState{

  @override
  List<Object?> get props => [];
}