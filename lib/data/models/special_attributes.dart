abstract class AbstractPropertyAttributes {
  Map<String, String> toJson() => {};
  Map<String, String> toScreen() => {};
}

class CommercialPropertyAttributes extends AbstractPropertyAttributes {
  CommercialPropertyAttributes({
    this.id = -1,
    this.floor = 0,
    this.numberOfBathrooms = 0,
    this.numberOfBalconies = 0,
  });
  int id;
  int floor;
  int numberOfBalconies;
  int numberOfBathrooms;

  factory CommercialPropertyAttributes.fromJson(Map<String, dynamic> json) =>
      CommercialPropertyAttributes(
        id: json["id"],
        numberOfBathrooms: json["num_of_bathrooms"],
        numberOfBalconies: json["num_of_balconies"],
        floor: json["floor"],
      );
  @override
  Map<String, String> toJson() => {
        "num_of_bathrooms": numberOfBathrooms.toString(),
        "num_of_balconies": numberOfBalconies.toString(),
        "floor": floor.toString(),
      };
  @override
  Map<String, String> toScreen() => {
        "Bathrooms": numberOfBathrooms.toString(),
        "Balconies": numberOfBalconies.toString(),
        "Floor": floor.toString(),
      };
  CommercialPropertyAttributes copyWith({
    int? id,
    int? floor,
    int? numberOfBalconies,
    int? numberOfBathrooms,
  }) =>
      CommercialPropertyAttributes(
        id: id ?? this.id,
        floor: floor ?? this.floor,
        numberOfBalconies: numberOfBalconies ?? this.numberOfBalconies,
        numberOfBathrooms: numberOfBathrooms ?? this.numberOfBathrooms,
      );
}

class ResidentialPropertyAttributes extends AbstractPropertyAttributes {
  ResidentialPropertyAttributes({
    this.id = -1,
    this.numberOfBedrooms = 0,
    this.numberOfBathrooms = 0,
    this.numberOfBalconies = 0,
    this.numberOfLivingRooms = 0,
  });
  int id;
  int numberOfBalconies;
  int numberOfBathrooms;
  int numberOfBedrooms;
  int numberOfLivingRooms;

  factory ResidentialPropertyAttributes.fromJson(Map<String, dynamic> json) =>
      ResidentialPropertyAttributes(
        id: json["id"],
        numberOfBedrooms: json["num_of_bedrooms"],
        numberOfBathrooms: json["num_of_bathrooms"],
        numberOfBalconies: json["num_of_balconies"],
        numberOfLivingRooms: json["num_of_living_rooms"],
      );

  @override
  Map<String, String> toJson() => {
        "num_of_bathrooms": numberOfBathrooms.toString(),
        "num_of_balconies": numberOfBalconies.toString(),
        "num_of_bedrooms": numberOfBedrooms.toString(),
        "num_of_living_rooms": numberOfLivingRooms.toString(),
      };
  @override
  Map<String, String> toScreen() => {
        "Bathrooms": numberOfBathrooms.toString(),
        "Balconies": numberOfBalconies.toString(),
        "Bedrooms": numberOfBedrooms.toString(),
        "Living_rooms": numberOfLivingRooms.toString(),
      };

  ResidentialPropertyAttributes copyWith({
    int? numberOfBedrooms,
    int? numberOfLivingRooms,
    int? numberOfBalconies,
    int? numberOfBathrooms,
    int? id,
  }) =>
      ResidentialPropertyAttributes(
        id: id ?? this.id,
        numberOfBedrooms: numberOfBedrooms ?? this.numberOfBedrooms,
        numberOfLivingRooms: numberOfLivingRooms ?? this.numberOfLivingRooms,
        numberOfBalconies: numberOfBalconies ?? this.numberOfBalconies,
        numberOfBathrooms: numberOfBathrooms ?? this.numberOfBathrooms,
      );
}

class AgriculturalPropertyAttributes extends AbstractPropertyAttributes {
  AgriculturalPropertyAttributes({
    this.waterSources = 0
});

  int waterSources;

  factory AgriculturalPropertyAttributes.fromJson(Map<String, dynamic> json) =>
      AgriculturalPropertyAttributes(
        waterSources: json["water_sources"]
      );

  @override
  Map<String, String> toJson() => {
    "water_sources": waterSources.toString(),
  };
  @override
  Map<String, String> toScreen() => {
    "Water Sources": waterSources.toString(),
  };
}
