import 'package:nostra_casa/business_logic/promote_to_agency/promote_to_agency_bloc.dart';

import '../../utility/network_helper.dart';

class PromoteToAgencyService {
  static Future promoteToAgencyService(
      {required String endPoints, required PromoteAgencyApiEvent event}) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataWithFile(
      url: endPoints,
      useUserToken: true,
      body: event.promoteToAgencyState.toMapBody(),
      files: event.promoteToAgencyState.files,
      name: 'files',
    );

    return helperResponse;
  }
}