part of 'promote_to_agency_bloc.dart';

class PromoteToAgencyState extends Equatable {
  PromoteToAgencyState(
      {
         this.selectedLocation,
        this.files = const [],
         this.reason

      });

  List<File> files;
  LatLng? selectedLocation;
  String? reason;

  PromoteToAgencyState copyWith({
    List<File>? files,
    LatLng? selectedLocation,
    String? reason,

  }) =>
      PromoteToAgencyState(
        files: files ?? this.files,
        selectedLocation: selectedLocation ?? this.selectedLocation,
        reason: reason?? this.reason,
      );

  Map<String, String> toMapBody()  {
  Map<String, String> map = {
    "latitude": "${selectedLocation?.latitude}",
    "longitude": "${selectedLocation?.longitude}",
    "reason":reason.toString()
  };
  return map;

  }
  @override
  List<Object?> get props => [

    selectedLocation,
    files,
    reason,

  ];

}

class PromoteToAgencyLoadingState extends PromoteToAgencyState {

  @override
  List<Object> get props => [];
}
class PromoteToAgencyStatusState extends PromoteToAgencyState {
  PromoteToAgencyStatusState({required this.helperResponse});
  HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}