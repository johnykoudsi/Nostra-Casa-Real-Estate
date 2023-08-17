import 'package:nostra_casa/data/models/properties_model.dart';

import '../../business_logic/get_properties/get_all_properties_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class AllPropertiesService {
  static Future getAllPropertiesService({
    required GetAllPropertiesApiEvent event,
  }) async {
    String queryString =
        Uri(queryParameters: event.searchFilterProperties.toJson()).query;

    String urlWithParams = "${EndPoints.getAllProperties}?$queryString";

    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: urlWithParams,
      useUserToken: true,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeProperties data =
            welcomePropertiesFromJson2(helperResponse.response);
        return data.properties;
      } catch (e) {
        return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError);
      }
    }
    return helperResponse;
  }
  static Future getMyFavoriteService({
    required GetAllPropertiesApiEvent event,
  }) async {
    String queryString =
        Uri(queryParameters: event.searchFilterProperties.toJson2()).query;

    String urlWithParams = "${EndPoints.myFavorite}?$queryString";

    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: urlWithParams,
      useUserToken: true,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeProperties data =
            welcomePropertiesFromJson2(helperResponse.response);
        return data.properties;
      } catch (e) {
        return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError);
      }
    }
    return helperResponse;
  }
}
