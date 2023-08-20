

import 'dart:convert';

import 'package:nostra_casa/business_logic/rate_property/rate_property_bloc.dart';

import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class RatePropertyService{


  static Future ratePropertyService({
    required RatePropertyApiEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
      body: jsonEncode(event.toJson()),
        url:EndPoints.rateProperty(event.propertyId),
        useUserToken: true,
    );

    return helperResponse;

  }


}