import 'dart:convert';

WelcomeAmenities welcomeAmenitiesFromJson(String str) =>
    WelcomeAmenities.fromJson(json.decode(str));

class WelcomeAmenities {
  List<Amenity> amenities;

  WelcomeAmenities({
    required this.amenities,
  });

  factory WelcomeAmenities.fromJson(Map<String, dynamic> json) =>
      WelcomeAmenities(
        amenities: List<Amenity>.from(
            json["data"]["data"].map((x) => Amenity.fromJson(x))),
      );
}

class Amenity {
  int id;
  String name;
  String description;
  int active;
  dynamic amenityTypeId;

  Amenity({
    this.id = -1,
    this.name = "",
    this.description = "",
    this.active = 0,
    this.amenityTypeId,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json["id"] ?? -1,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        active: json["active"] ?? 0,
        amenityTypeId: json["amenity_type_id"],
      );
}

class AmenitiesSearchFilter {
  AmenitiesSearchFilter({required this.page});
  int page;

  AmenitiesSearchFilter copyWith({
    int? page,
  }) =>
      AmenitiesSearchFilter(
          page: page ?? this.page,
      );
}
