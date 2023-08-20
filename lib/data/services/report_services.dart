

import 'dart:convert';

import 'package:nostra_casa/data/models/report_categories.dart';

import '../../business_logic/get_report_categories/report_categories_bloc.dart';
import '../../business_logic/send_report_bloc/send_report_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class ReportServices{

  static Future getReportCategoriesService({
    required GetReportCategoryEvent event,
  }) async {

    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.reportCategory,
      useUserToken: true,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeReportCategories data = welcomeReportCategoriesFromJson(helperResponse.response);

        return data.data;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  static Future sendReportService(SendReportRequest event) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
      url: EndPoints.reportUser,
      useUserToken: true,
      body: json.encode(event.toJson()),
    );

    return helperResponse;
  }
}