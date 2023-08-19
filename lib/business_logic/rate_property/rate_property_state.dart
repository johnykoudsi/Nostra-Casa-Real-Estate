part of 'rate_property_bloc.dart';

abstract class RatePropertyState extends Equatable {
  const RatePropertyState();
}

class RatePropertyInitial extends RatePropertyState {
  @override
  List<Object> get props => [];
}
class RatePropertyLoading extends RatePropertyState {
  @override
  List<Object> get props => [];
}
class RatePropertyStatus extends RatePropertyState {
  RatePropertyStatus({required this.helperResponse});
  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}