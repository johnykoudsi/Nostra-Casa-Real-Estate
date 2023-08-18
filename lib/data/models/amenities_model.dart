import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:nostra_casa/utility/endpoints.dart';

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

class Amenity extends Equatable {
  int id;
  String name;
  String nameAr;
  String description;
  int active;
  String file;

  Amenity({
    this.id = -1,
    this.name = "",
    this.nameAr = "",
    this.description = "",
    this.active = 0,
    this.file = "",
  });

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json["id"] ?? -1,
        name: json["name_en"] ?? '',
        nameAr: json["name_ar"] ?? '',
        description: json["description"] ?? '',
        active: json["active"] ?? 0,
        file: "${EndPoints.kMainUrlAssets}${json["file"]}",
      );

  @override
  List<Object?> get props => [id,nameAr,name, description, active];
}

class AmenitiesSearchFilter {
  AmenitiesSearchFilter({this.page = 1});
  int page;

  AmenitiesSearchFilter copyWith({
    int? page,
  }) =>
      AmenitiesSearchFilter(
        page: page ?? this.page,
      );
}
