part of 'add_property_bloc.dart';

class AddPropertyState extends Equatable implements GetRequestModel {
  AddPropertyState(
      {this.tags = const [],
      this.selectedPropertyType,
      this.propertyService,
      this.selectedLocation,
      this.images = const [],
      this.propertyTypeAttributes,
      this.region});

  String? region;
  List<String> tags;
  List<File> images;
  PropertyType? selectedPropertyType;
  PropertyService? propertyService;
  LatLng? selectedLocation;
  Map<String, int>? propertyTypeAttributes;

  AddPropertyState copyWith({
    String? region,
    List<File>? images,
    List<String>? tags,
    Map<String, int>? propertyTypeAttributes,
    PropertyType? selectedPropertyType,
    PropertyService? propertyService,
    LatLng? selectedLocation,
  }) =>
      AddPropertyState(
        propertyTypeAttributes:
            propertyTypeAttributes ?? this.propertyTypeAttributes,
        images: images ?? this.images,
        tags: tags ?? this.tags,
        selectedPropertyType: selectedPropertyType ?? this.selectedPropertyType,
        propertyService: propertyService ?? this.propertyService,
        selectedLocation: selectedLocation ?? this.selectedLocation,
        region: region ?? this.region,
      );

  @override
  List<Object?> get props => [
        tags,
        selectedPropertyType,
        propertyService,
        selectedLocation,
        images,
        images.length,
        propertyTypeAttributes,
        region
      ];
}

enum PropertyType {
  residential,
  agricultural,
  commercial,
}

enum PropertyService { sale, rent, holiday }
