part of 'amenity_bloc.dart';

abstract class AmenityState {}

class AmenityInitial extends AmenityState {}

class AmenityLoadedState extends AmenityState {
  List<Amenity> amenities;
  bool hasReachedMax;

  AmenityLoadedState(
      {this.amenities = const <Amenity>[],
      required this.hasReachedMax});

  AmenityLoadedState copyWith({
    List<Amenity>? amenities,
    bool? hasReachedMax,
  }) {
    return AmenityLoadedState(
      amenities: amenities ?? this.amenities,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [amenities, hasReachedMax];
}

class AmenityErrorState extends AmenityState {
  AmenityErrorState({required this.helperResponse});

  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse];
}
