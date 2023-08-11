part of 'add_property_bloc.dart';

class AddPropertyState extends Equatable {
  AddPropertyState({
    this.selectedPropertyType,
    this.propertyService,
    this.selectedLocation,
    this.images = const [],
    this.propertyAttributes,
    this.propertyTypeSpecialAttributes,
    this.selectedAmenity = const [],
    this.selectedTag = const [],
    this.title = "",
    this.description = "",
    this.price = 250,
    this.area = 300,
    this.countryModel,
    this.city,
  });

  List<File> images;
  PropertyType? selectedPropertyType;
  PropertyService? propertyService;
  LatLng? selectedLocation;
  PropertyAttributes? propertyAttributes;
  Map<String, int>? propertyTypeSpecialAttributes;
  List<Amenity> selectedAmenity;
  List<Tag> selectedTag;
  String title;
  String description;
  num price;
  num area;
  City? city;
  CountryModel? countryModel;

  AddPropertyState copyWith({
    List<File>? images,
    PropertyAttributes? propertyAttributes,
    Map<String, int>? propertyTypeSpecialAttributes,
    PropertyType? selectedPropertyType,
    PropertyService? propertyService,
    LatLng? selectedLocation,
    List<Amenity>? selectedAmenity,
    List<Tag>? selectedTag,
    String? region,
    String? title,
    String? description,
    num? price,
    num? area,
    City? city,
    CountryModel? countryModel,
  }) =>
      AddPropertyState(
        propertyAttributes: propertyAttributes ?? this.propertyAttributes,
        propertyTypeSpecialAttributes:
            propertyTypeSpecialAttributes ?? this.propertyTypeSpecialAttributes,
        images: images ?? this.images,
        selectedPropertyType: selectedPropertyType ?? this.selectedPropertyType,
        propertyService: propertyService ?? this.propertyService,
        selectedLocation: selectedLocation ?? this.selectedLocation,
        selectedAmenity: selectedAmenity ?? this.selectedAmenity,
        selectedTag: selectedTag ?? this.selectedTag,
        city: city ?? this.city,
        countryModel: countryModel ?? this.countryModel,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        area: area ?? this.area,
      );

  Map<String, String> toMapBody() {
    Map<String, String> map = {
      "name": title,
      "area": area.toString(),
      "price": price.toString(),
      "description": description,
      "latitude": "${selectedLocation?.latitude}",
      "longitude": "${selectedLocation?.longitude}",
      "specialAttributes": json.encode(propertyTypeSpecialAttributes) == "null"
          ? "{}"
          : json.encode(propertyTypeSpecialAttributes).toString(),
    }..addAll(propertyAttributes!.toJson());
    if (selectedAmenity.isNotEmpty) {
      for (int i = 0; i < selectedAmenity.length; i++) {
        map["amenities[$i]"] = selectedAmenity[i].id.toString();
      }
    }
    if (selectedTag.isNotEmpty) {
      for (int i = 0; i < selectedTag.length; i++) {
        map["tags[$i]"] = selectedTag[i].id.toString();
      }
    }
    return map;
  }

  @override
  List<Object?> get props => [
        selectedPropertyType,
        propertyService,
        selectedLocation,
        images,
        propertyAttributes,
        propertyTypeSpecialAttributes,
        city,
        countryModel,
        selectedAmenity,
        selectedTag,
        title,
        description,
        price,
        area
      ];
}
