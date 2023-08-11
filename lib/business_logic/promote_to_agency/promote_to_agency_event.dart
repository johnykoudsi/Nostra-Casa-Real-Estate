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