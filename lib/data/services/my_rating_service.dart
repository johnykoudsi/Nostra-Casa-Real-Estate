import 'dart:convert';
import '../../business_logic/my_rating/my_rating_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';
import '../models/property_reviews_model.dart';

class MyRatingService{

  static Future getMyRating({
    required GetMyRatingApiEvent event,
  }) async {

    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.myPropertyRate(event.propertyId),
      useUserToken: true,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        PropertyReviewsModel data
        = PropertyReviewsModel.fromJson(json.decode(helperResponse.response)["data"][0]);
        return data;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    if(helperResponse.servicesResponse == ServicesResponseStatues.someThingWrong
    && helperResponse.response == "you don't have rating for this property"){
      return null;
    }
    return helperResponse;
  }
}