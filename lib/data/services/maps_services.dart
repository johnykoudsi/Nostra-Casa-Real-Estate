import 'dart:convert';

import 'package:nostra_casa/data/models/properties_model.dart';

import '../../business_logic/get_nearby_properties/get_nearby_properties_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class MapsServices {
  static Future getNearbyPlacesService({
    required GetNearbyMapsEvent event,
  }) async {

    Map<String,dynamic> mapBody ={
      "longitude": event.center.longitude,
      "latitude": event.center.latitude,
    };

    if(event.propertyType != PropertyType.all){
      mapBody["property_type"] = propertyTypeBackEnd.reverse[event.propertyType];
    }

    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
      url: EndPoints.nearbyProperties,
      body: json.encode(mapBody),
      useUserToken: true,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeProperties data =
            welcomePropertiesFromJson(helperResponse.response);

        return data.properties;
      } catch (e) {
        return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError);
      }
    }
    return helperResponse;
  }
}
