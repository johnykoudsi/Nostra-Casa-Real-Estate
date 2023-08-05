

import 'package:nostra_casa/data/models/country_and_city_model.dart';
import 'package:nostra_casa/utility/enums.dart';

import '../../business_logic/country_bloc/country_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/network_helper.dart';

class CountryServices{

  static Future getNearbyPlacesService({
    required GetCountryCityEvent event,
  }) async {

    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.country,
      useUserToken: true,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeCountryAndCity data =
        welcomeCountryAndCityFromJson(helperResponse.response);

        return data.country;
      } catch (e) {
        return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }
}