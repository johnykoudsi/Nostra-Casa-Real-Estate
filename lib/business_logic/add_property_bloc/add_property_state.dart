part of 'add_property_bloc.dart';

class AddPropertyState extends Equatable implements GetRequestModel{
  AddPropertyState(
      {this.tags = const [],
      this.selectedPropertyType,
      this.propertyService,
      this.selectedLocation,
      this.images = const [],
      this.propertyTypeConstAttributes,
      this.propertyTypeSpecialAttributes,
      this.region,
      this.selectedAmenity = const [],
      this.selectedTag = const [],
      this.title,
      this.description,
      this.price,
      this.area});

  List<String> tags;
  List<File> images;
  PropertyType? selectedPropertyType;
  PropertyService? propertyService;
  LatLng? selectedLocation;
  Map<String, int>? propertyTypeConstAttributes;
  Map<String, int>? propertyTypeSpecialAttributes;
  String? region;
  List<Amenity> selectedAmenity;
  List<Tag> selectedTag;
  String? title;
  String? description;
  String? price;
  String? area;

  AddPropertyState copyWith(
          {List<File>? images,
          List<String>? tags,
          Map<String, int>? propertyTypeConstAttributes,
          Map<String, int>? propertyTypeSpecialAttributes,
          PropertyType? selectedPropertyType,
          PropertyService? propertyService,
          LatLng? selectedLocation,
          List<Amenity>? selectedAmenity,
          List<Tag>? selectedTag,
          String? region,
          String? title,
          String? description,
          String? price,
          String? area}) =>
      AddPropertyState(
        propertyTypeConstAttributes:
            propertyTypeConstAttributes ?? this.propertyTypeConstAttributes,
        propertyTypeSpecialAttributes:
            propertyTypeSpecialAttributes ?? this.propertyTypeSpecialAttributes,
        images: images ?? this.images,
        tags: tags ?? this.tags,
        selectedPropertyType: selectedPropertyType ?? this.selectedPropertyType,
        propertyService: propertyService ?? this.propertyService,
        selectedLocation: selectedLocation ?? this.selectedLocation,
        selectedAmenity: selectedAmenity ?? this.selectedAmenity,
        selectedTag: selectedTag ?? this.selectedTag,
        region: region ?? this.region,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        area: area ?? this.area,
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
        selectedTag,
        title,
        description,
        price,
        area
      ];
}


