import 'dart:convert';

import 'package:nostra_casa/data/models/properties_model.dart';

import '../../business_logic/get_nearby_properties/get_nearby_properties_bloc.dart';
import '../../utility/constant_logic_validations.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class MapsServices {
  static Future getNearbyPlacesService({
    required GetNearbyMapsEvent event,
  }) async {

    Map<String,String> mapBody ={
      "longitude": event.center.longitude.toString(),
      "latitude": event.center.latitude.toString(),
      "radius": mapRadius.toString(),
    };

    if(event.propertyType != PropertyType.all){
      mapBody["filter[property-type]"] = propertyTypeBackEnd.reverse[event.propertyType].toString();
    }
    if(event.propertyService != PropertyService.all){
      mapBody["filter[property-service]"] = propertyServiceBackEnd1.reverse[event.propertyService].toString();
    }
    print(mapBody.toString());

    HelperResponse helperResponse = await NetworkHelpers.postDataWithFile(
      url: EndPoints.nearbyProperties,
      body: mapBody,
      useUserToken: true,
      name: '',
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
