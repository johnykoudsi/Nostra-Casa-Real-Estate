
import 'package:nostra_casa/data/models/contact_info_model.dart';

import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class ContactInfoServices{

  static Future getAboutRequest() async {

    HelperResponse helperResponse = await NetworkHelpers.getDataHelper(
      url: EndPoints.about,
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeAbout data = welcomeAboutFromJson(helperResponse.response);
        return data;
      } catch (e) {
        return helperResponse.copyWith(servicesResponse: ServicesResponseStatues.modelError);
      }
    }

    return helperResponse;
  }

}