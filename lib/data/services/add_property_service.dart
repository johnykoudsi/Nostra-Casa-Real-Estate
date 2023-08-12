import 'dart:convert';
import '../../business_logic/send_property_bloc/send_property_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/network_helper.dart';

class AddPropertyService {
  static Future addPropertyService(
      {required String endPoints, required SendPropertyApiEvent event}) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataWithFile(
      url: endPoints,
      useUserToken: true,
      body: event.addPropertyState.toMapBody(),
      files: event.addPropertyState.images,
      name: 'images',
    );

    return helperResponse;
  }
}
