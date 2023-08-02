import 'dart:convert';

import 'package:nostra_casa/data/models/properties_model.dart';

import '../../business_logic/get_bloc/get_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class MapsServices {
  static Future getNearbyPlacesService({
    required GetNearbyMapsEvent event,
  }) async {
    print({"longitude": event.center.longitude});
    print({"latitude": event.center.latitude});
    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
      url: EndPoints.nearbyProperties,
      body: json.encode({
        "longitude": event.center.longitude,
        "latitude": event.center.latitude,
      }),
      useUserToken: true,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      //try {
        WelcomeProperties data =
            welcomePropertiesFromJson(helperResponse.response);

        return data.properties;
      // } catch (e) {
      //   return helperResponse.copyWith(
      //       servicesResponse: ServicesResponseStatues.modelError);
      // }
    }
    return helperResponse;
  }
}
