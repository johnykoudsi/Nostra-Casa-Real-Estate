part of 'promote_to_agency_bloc.dart';
abstract class PromoteToAgencyState extends Equatable { const PromoteToAgencyState();
}
class PromoteToAgencyInitial extends PromoteToAgencyState {
  @override
  List<Object> get props => [];
}

class PromoteToAgencyLoading extends PromoteToAgencyState {
  @override
  List<Object> get props => [];
}

class PromoteToAgencyStatus extends PromoteToAgencyState {
  PromoteToAgencyStatus({required this.helperResponse});
  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}
