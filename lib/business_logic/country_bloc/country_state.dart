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

  List<CountryModel> countryModel;

  List<City> getCityByCountryName(String name) {
    int index = countryModel.indexWhere((element) => element.name == name);
    if (index != -1) {
      return countryModel[index].cities;
    }
    return [];
  }

  CountryModel getCountryFromName(String? name) =>
      countryModel.firstWhere((element) => name == element.name);

  City getCityFromName({required String? name, required String? countryName}) =>
      getCityByCountryName(countryName??'')
          .firstWhere((element) => name == element.name);

  @override
  List<Object> get props => [countryModel];
}

class CountryErrorState extends CountryState {
  CountryErrorState({required this.helperResponse});
  HelperResponse helperResponse;

  @override
  List<Object> get props =>
      [helperResponse.servicesResponse, helperResponse.response];
}
