part of 'add_property_bloc.dart';

class AddPropertyState extends Equatable {
  AddPropertyState({
    this.tags = const [],
    this.selectedPropertyType,
    this.propertyService,
    this.selectedLocation,
    this.images = const [],
    this.propertyTypeConstAttributes,
    this.propertyTypeSpecialAttributes,
    this.region,
    this.selectedAmenity = const [],

  });

  List<String> tags;
  List<File> images;
  PropertyType? selectedPropertyType;
  PropertyService? propertyService;
  LatLng? selectedLocation;
  Map<String,int>? propertyTypeConstAttributes;
  Map<String,int>? propertyTypeSpecialAttributes;
  String? region;
  List<Amenity> selectedAmenity;


  AddPropertyState copyWith({
    List<File>? images,
    List<String>? tags,
    Map<String,int>? propertyTypeConstAttributes,
    Map<String,int>? propertyTypeSpecialAttributes,
    PropertyType? selectedPropertyType,
    PropertyService? propertyService,
    LatLng? selectedLocation,
    List<Amenity>? selectedAmenity,
    String? region,

  }) =>
      AddPropertyState(
        propertyTypeConstAttributes: propertyTypeConstAttributes ?? this.propertyTypeConstAttributes,
        propertyTypeSpecialAttributes: propertyTypeSpecialAttributes ?? this.propertyTypeSpecialAttributes,
        images: images ?? this.images,
        tags: tags ?? this.tags,
        selectedPropertyType: selectedPropertyType ?? this.selectedPropertyType,
        propertyService: propertyService ?? this.propertyService,
        selectedLocation: selectedLocation ?? this.selectedLocation,
        selectedAmenity: selectedAmenity ?? this.selectedAmenity,
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
        propertyTypeConstAttributes,
        propertyTypeSpecialAttributes,
    region,
    selectedAmenity,
      ];
}

enum PropertyType {
  residential,
  agricultural,
  commercial,
}

enum PropertyService { sale, rent, holiday }
