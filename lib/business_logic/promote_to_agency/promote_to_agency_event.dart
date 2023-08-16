part of 'promote_to_agency_bloc.dart';

abstract class PromoteToAgencyEvent extends Equatable {
  const PromoteToAgencyEvent();
}
class PromoteToAgencyApiEvent extends PromoteToAgencyEvent{

  PromoteToAgencyApiEvent({required this.reason,required this.location,required this.files});

  String reason;
  LatLng location;
  List<File> files;

  Map<String, String> toMapBody() {
    Map<String, String> map = {

      "reason": reason.toString(),
      "latitude": "${location?.latitude}",
      "longitude": "${location?.longitude}",
    };

    return map;
  }

  @override
  List<Object?> get props => [reason,location,files];

}