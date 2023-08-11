import 'dart:convert';
import '../../business_logic/send_property_bloc/send_property_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/network_helper.dart';

class AddPropertyService {

  static Future addAgriculturalService(SendPropertyApiEvent event) async {

    HelperResponse helperResponse = await NetworkHelpers.postDataWithFile(
      url: EndPoints.addAgricultural,
      useUserToken: true,
      body: event.addPropertyState.toMapBody(),
      files: event.addPropertyState.images,
    );

    return helperResponse;
  }

}
