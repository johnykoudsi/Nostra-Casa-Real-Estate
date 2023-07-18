part of 'add_property_bloc.dart';

class AddPropertyState extends Equatable {
  AddPropertyState(
      {this.tags = const [],
      this.selectedPropertyType,
      this.propertyService,
      this.selectedLocation});
  List<String> tags;
  PropertyType? selectedPropertyType;
  PropertyService? propertyService;
  LatLng? selectedLocation;

  AddPropertyState copyWith({
    List<String>? tags,
    PropertyType? selectedPropertyType,
    PropertyService? propertyService,
    LatLng? selectedLocation,
  }) =>
      AddPropertyState(
        tags: tags ?? this.tags,
        selectedPropertyType: selectedPropertyType ?? this.selectedPropertyType,
        propertyService: propertyService ?? this.propertyService,
        selectedLocation: selectedLocation ?? this.selectedLocation,
      );

  @override
  List<Object?> get props =>
      [tags, selectedPropertyType, propertyService, selectedLocation];
}

enum PropertyType {
  residential,
  agricultural,
  commercial,
}

enum PropertyService { sale, rent, holiday }
