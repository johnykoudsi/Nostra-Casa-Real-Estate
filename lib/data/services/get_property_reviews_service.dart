

import 'package:nostra_casa/business_logic/get_property_reviews/get_property_reviews_bloc.dart';
import 'package:nostra_casa/data/models/property_reviews_model.dart';

import '../../utility/constant_logic_validations.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class GetPropertyReviewsService {
  Future getReviewsService({
    required GetPropertyReviewsApiEvent event,
  }) async {

    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.getPropertyReviews(
        propertyId: event.propertyId,
        page: event.reviewsSearchFilter.page,
        limit: 2,
      ),
      useUserToken: true,
    );
    print(helperResponse.servicesResponse);

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeToPropertyReviews data =
        welcomeToPropertyReviewsFromJson(helperResponse.response);
        return data.propertyReviewsModel;
      } catch (e) {
        return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError);
      }
    }
    return helperResponse;
  }
}