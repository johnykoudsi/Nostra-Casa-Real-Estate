part of 'amenity_bloc.dart';

abstract class AmenityEvent {}

class GetAmenityApiEvent extends AmenityEvent {
  GetAmenityApiEvent({required this.searchFilterProperties});

  AmenitiesSearchFilter searchFilterProperties;

  @override
  List<Object?> get props => [searchFilterProperties];
}

class ChangeToLoadingApiEvent extends AmenityEvent {
  ChangeToLoadingApiEvent(
      { this.searchFilterProperties});

  AmenitiesSearchFilter? searchFilterProperties;

  @override
  List<Object?> get props => [searchFilterProperties];
}
