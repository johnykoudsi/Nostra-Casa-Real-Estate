part of 'add_property_bloc.dart';

class AddPropertyState extends Equatable {
  AddPropertyState({
    this.tags = const [],
    this.selectedPropertyType,
    this.propertyService,
    this.selectedLocation,
    this.images = const [],
    this.propertyTypeAttributes,
    this.selectedAmenity = const [],
  });

  List<String> tags;
  List<File> images;
  PropertyType? selectedPropertyType;
  PropertyService? propertyService;
  LatLng? selectedLocation;
  Map<String, int>? propertyTypeAttributes;
  List<Amenity> selectedAmenity;

  AddPropertyState copyWith({
    List<File>? images,
    List<String>? tags,
    Map<String, int>? propertyTypeAttributes,
    PropertyType? selectedPropertyType,
    PropertyService? propertyService,
    LatLng? selectedLocation,
    List<Amenity>? selectedAmenity,
  }) =>
      AddPropertyState(
        propertyTypeAttributes:
            propertyTypeAttributes ?? this.propertyTypeAttributes,
        images: images ?? this.images,
        tags: tags ?? this.tags,
        selectedPropertyType: selectedPropertyType ?? this.selectedPropertyType,
        propertyService: propertyService ?? this.propertyService,
        selectedLocation: selectedLocation ?? this.selectedLocation,
        selectedAmenity: selectedAmenity ?? this.selectedAmenity,
      );

  @override
  List<Object?> get props => [
        tags,
        selectedPropertyType,
        propertyService,
        selectedLocation,
        images,
        images.length,
    selectedAmenity,
        propertyTypeAttributes,
      ];
}

enum PropertyType {
  residential,
  agricultural,
  commercial,
}

enum PropertyService { sale, rent, holiday }
