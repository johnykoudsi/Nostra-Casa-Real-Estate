import 'package:nostra_casa/data/models/my_rating.dart';

import '../../business_logic/my_rating/my_rating_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class MyRatingService{

  static Future getMyRating({
    required GetMyRatingApiEvent event,
  }) async {

    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.myPropertyRate(event.propertyId),
      useUserToken: true,
    );
    print("Helper : "+helperResponse.response);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeToMyPropertyRate data =
        welcomeToMyPropertyRateFromJson(helperResponse.response);
//print("ffffffffffffffffffff"+data.success.toString());
        return data.success;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }
}