import 'dart:convert';

import '../../business_logic/add_to_favorite/add_favorite_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class AddToFavoriteServices {
  static Future getAmenityService({
    required GetPropertyFavouriteEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.isFavorite(event.productObjectId),
      useUserToken: true,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      return json.decode(helperResponse.response)["data"];
    }
    return helperResponse;
  }

  static Future toggleFavouriteService({
    required ToggleFavouriteEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
      url: EndPoints.saveFavorite,
      body: json.encode({"property_id": event.productObjectId}),
      useUserToken: true,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      return json.decode(helperResponse.response)["data"];
    }
    return helperResponse;
  }
}
