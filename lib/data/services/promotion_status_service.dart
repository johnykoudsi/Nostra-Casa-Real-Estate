import 'package:nostra_casa/utility/endpoints.dart';

import '../../business_logic/agency_promotion_status/agency_promotion_status_bloc.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';
import '../models/request_agency_promotion_status.dart';

class PromotionStatusService{

  static Future getPromotionStatus({
    required GetPromotionStatusEvent event,
  }) async {

    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.requestAgencyStatus,
      useUserToken: true,
    );
    print("Helper : "+helperResponse.response);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeToRequestStatus data =
        welcomeToRequestStatusFromJson(helperResponse.response);

        return data.data.status;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }
}