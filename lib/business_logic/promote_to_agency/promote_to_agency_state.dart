part of 'promote_to_agency_bloc.dart';

class PromoteToAgencyState extends Equatable {
  PromoteToAgencyState(
      {
        this.selectedLocation,
        this.files = const [],
        this.region,

      });

  List<File> files;
  LatLng? selectedLocation;
  String? region;

  PromoteToAgencyState copyWith({
    List<File>? files,
    LatLng? selectedLocation,
    String? region,

  }) =>
      PromoteToAgencyState(
        files: files ?? this.files,
        selectedLocation: selectedLocation ?? this.selectedLocation,
        region: region ?? this.region,
      );

  Map<String, dynamic> toJson() => {

  };
  @override
  List<Object?> get props => [

    selectedLocation,
    files,
    region,

  ];
}
