import 'package:nostra_casa/business_logic/notifications/notifications_bloc.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/data/models/notifications_model.dart';
import 'package:nostra_casa/utility/constant_logic_validations.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

class NotificationsService {
  Future getNotificationsService({
    required GetNotificationApiEvent event,
  }) async {
    var id;
    final userState = globalUserBloc.state;
    if(userState is UserLoggedState){
       id = userState.user.user.id;
    }
    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.getNotifications(
        userId: id,
        page: event.notificationsSearchFilter.page,
        limit: kProductsGetLimit,
      ),
      useUserToken: true,
    );
    print(helperResponse.servicesResponse);

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        WelcomeToMyNotifications data =
            welcomeToMyNotificationsFromJson(helperResponse.response);
        return data.notificationModel;
      } catch (e) {
        return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError);
      }
    }
    return helperResponse;
  }
}
