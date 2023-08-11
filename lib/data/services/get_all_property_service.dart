

import 'package:nostra_casa/data/models/properties_model.dart';

import '../../business_logic/get_properties/get_all_properties_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class AllPropertiesService {

  static Future getAllPropertiesService({
    required GetAllPropertiesApiEvent event,
  }) async {
    // todo : add query parameters
    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.getAllProperties,
      useUserToken: true,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeProperties data = welcomePropertiesFromJson2(helperResponse.response);
        return data.properties;
      } catch (e) {
        return helperResponse.copyWith(servicesResponse: ServicesResponseStatues.modelError);
      }
    }
    return helperResponse;
  }
}