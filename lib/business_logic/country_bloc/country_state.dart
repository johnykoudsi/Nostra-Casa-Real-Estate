part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();
}

class CountryLoadingState extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryDoneState extends CountryState {

  CountryDoneState({required this.countryModel});

  CountryModel countryModel;

  @override
  List<Object> get props => [countryModel];
}

class CountryErrorState extends CountryState {

  CountryErrorState({required this.helperResponse});
  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}