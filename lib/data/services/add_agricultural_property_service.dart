import 'dart:convert';

import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/network_helper.dart';

class AddAgriculturalsPropertyService {

  static Future addAgriculturalsService(AddPropertyEvent event) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
      url: EndPoints.verifyAndSignUp,
      body: json.encode(event.toJson()),
    );

    // if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
    //   try {
    //     return welcomeUserFromJson(helperResponse.response).data;
    //   } catch (e) {
    //     return helperResponse.copyWith(
    //       servicesResponse: ServicesResponseStatues.modelError,
    //     );
    //   }
    // }

    return helperResponse;
  }

}
