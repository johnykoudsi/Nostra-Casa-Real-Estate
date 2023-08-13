part of 'agency_promotion_status_bloc.dart';

abstract class AgencyPromotionStatusState extends Equatable {

}
class AgencyPromotionStatusLoadingState extends AgencyPromotionStatusState {
  @override
  List<Object> get props => [];
}
class AgencyPromotionStatusDoneState extends AgencyPromotionStatusState {
  String? status;

  AgencyPromotionStatusDoneState(
      { required this.status});

  AgencyPromotionStatusDoneState copyWith({
     String? status,

  }) {
    return AgencyPromotionStatusDoneState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
class AgencyPromotionStatusErrorState extends AgencyPromotionStatusState {
  AgencyPromotionStatusErrorState({required this.helperResponse});

  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse];
}