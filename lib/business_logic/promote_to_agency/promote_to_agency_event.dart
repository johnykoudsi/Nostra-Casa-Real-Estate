part of 'promote_to_agency_bloc.dart';

abstract class PromoteToAgencyEvent extends Equatable {
  const PromoteToAgencyEvent();

  Map<String, dynamic> toJson() => {};
}

class AgencyLocationEvent extends PromoteToAgencyEvent {
  AgencyLocationEvent({required this.latLng});

  LatLng latLng;

  @override
  List<Object?> get props => [latLng];
}

// class PromoteAgencyApiEvent extends PromoteToAgencyEvent {
//   PromoteAgencyApiEvent({
//     //  required this.applicationRequest,
//     required this.selectedLocation,
//     required this.files,
//   });

  //String applicationRequest;
  // LatLng? selectedLocation;
  // List<File> files;

  // Map<String, dynamic> toJson() {
  //   final json = {
  //     "latitude":"${selectedLocation?.latitude}",
  //     "longitude":"${selectedLocation?.longitude}",
  //     "files":
  //   };
  //   json.removeWhere(
  //       (key, value) => value == null || value == "" || value.isEmpty);
  //   return json;
  // }

//   @override
//   List<Object?> get props =>
//       [phoneNumber, email, fullName, gender, facebook, dateOfBirth];
// }
