abstract class PropertyAttributes {
  Map<String, String> toJson() => {};
}

class CommercialPropertyAttributes extends PropertyAttributes {
  CommercialPropertyAttributes({
    this.floor = 0,
    this.numberOfBathrooms = 0,
    this.numberOfBalconies = 0,
  });

  int floor;
  int numberOfBalconies;
  int numberOfBathrooms;

  @override
  Map<String, String> toJson() => {
        "num_of_bathrooms": numberOfBathrooms.toString(),
        "num_of_balconies": numberOfBalconies.toString(),
        "floor": floor.toString(),
      };
  CommercialPropertyAttributes copyWith({
    int? floor,
    int? numberOfBalconies,
    int? numberOfBathrooms,
  }) =>
      CommercialPropertyAttributes(
        floor: floor ?? this.floor,
        numberOfBalconies: numberOfBalconies ?? this.numberOfBalconies,
        numberOfBathrooms: numberOfBathrooms ?? this.numberOfBathrooms,
      );
}

class ResidentialPropertyAttributes extends PropertyAttributes {
  ResidentialPropertyAttributes({
    this.numberOfBedrooms = 0,
    this.numberOfBathrooms = 0,
    this.numberOfBalconies = 0,
    this.numberOfLivingRooms = 0,
  });
  int numberOfBalconies;
  int numberOfBathrooms;
  int numberOfBedrooms;
  int numberOfLivingRooms;

  @override
  Map<String, String> toJson() => {
        "num_of_bathrooms": numberOfBathrooms.toString(),
        "num_of_balconies": numberOfBalconies.toString(),
        "num_of_bedrooms": numberOfBedrooms.toString(),
        "num_of_living_rooms": numberOfLivingRooms.toString(),
      };

  ResidentialPropertyAttributes copyWith({
    int? numberOfBedrooms,
    int? numberOfLivingRooms,
    int? numberOfBalconies,
    int? numberOfBathrooms,
  }) =>
      ResidentialPropertyAttributes(
        numberOfBedrooms: numberOfBedrooms ?? this.numberOfBedrooms,
        numberOfLivingRooms: numberOfLivingRooms ?? this.numberOfLivingRooms,
        numberOfBalconies: numberOfBalconies ?? this.numberOfBalconies,
        numberOfBathrooms: numberOfBathrooms ?? this.numberOfBathrooms,
      );
}

class AgriculturalPropertyAttributes extends PropertyAttributes {}
