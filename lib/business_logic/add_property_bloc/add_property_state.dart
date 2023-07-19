part of 'add_property_bloc.dart';

class AddPropertyState extends Equatable {
  AddPropertyState(
      {this.tags = const [],
      this.selectedPropertyType,
      this.propertyService,
      this.selectedLocation,
      this.images=const [],
      });
  List<String> tags;
  List<File> images;
  PropertyType? selectedPropertyType;
  PropertyService? propertyService;
  LatLng? selectedLocation;
  
  AddPropertyState copyWith({
    List<File>? images,
    List<String>? tags,
    PropertyType? selectedPropertyType,
    PropertyService? propertyService,
    LatLng? selectedLocation,
  }) =>
      AddPropertyState(
        images: images ?? this.images,
        tags: tags ?? this.tags,
        selectedPropertyType: selectedPropertyType ?? this.selectedPropertyType,
        propertyService: propertyService ?? this.propertyService,
        selectedLocation: selectedLocation ?? this.selectedLocation,
      );

  @override
  List<Object?> get props =>
      [tags, selectedPropertyType, propertyService, selectedLocation,images,images.length];
}

enum PropertyType {
  residential,
  agricultural,
  commercial,
}

enum PropertyService { sale, rent, holiday }
