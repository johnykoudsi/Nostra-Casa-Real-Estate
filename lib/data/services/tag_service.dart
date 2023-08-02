import 'package:nostra_casa/data/models/tags_model.dart';
import 'package:nostra_casa/utility/constant_logic_validations.dart';

import '../../business_logic/tag_bloc/tag_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class TagService {
  Future getTagService({
    required GetTagApiEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.getTags(
        page: event.searchFilterProperties.page,
        limit: kProductsGetLimit,
      ),
      useUserToken: true,
    );
    print(helperResponse.servicesResponse);

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
      WelcomeTags data = welcomeTagsFromJson(helperResponse.response);
      return data.tags;
      } catch (e) {
        return helperResponse.copyWith(servicesResponse: ServicesResponseStatues.modelError);
      }
    }
    return helperResponse;
  }
}
