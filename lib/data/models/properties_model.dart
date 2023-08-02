import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

WelcomeProperties welcomePropertiesFromJson(String str) =>
    WelcomeProperties.fromJson(json.decode(str));

String welcomePropertiesToJson(WelcomeProperties data) =>
    json.encode(data.toJson());

class WelcomeProperties {
  List<Properties> properties;

  WelcomeProperties({
    required this.properties,
  });

  factory WelcomeProperties.fromJson(Map<String, dynamic> json) =>
      WelcomeProperties(
        properties: List<Properties>.from(
            json["data"].map((x) => Properties.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(properties.map((x) => x.toJson())),
      };
}

class Properties {
  int id;
  String name;
  num area;
  num price;
  String description;
  LatLng location;
  String status;

  Properties({
    this.id = -1,
    this.name = "",
    this.area = 0,
    this.price = 0,
    this.description = "",
    this.location = const LatLng(0, 0),
    this.status = '',
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        area: json["area"] ?? 0,
        price: json["price"] ?? 0,
        description: json["description"] ?? "",
        location: LatLng(double.tryParse(json["latitude"]) ?? 0,
            double.tryParse(json["longitude"]) ?? 0),
        status: json["status"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "area": area,
        "price": price,
        "description": description,
        // "latitude": latitude,
        // "longitude": longitude,
        "status": status,
      };
}
