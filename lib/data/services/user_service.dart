import 'dart:convert';

import '../../business_logic/user/user_bloc.dart';
import '../../utility/endpoints.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';
import '../models/user_model.dart';

class UserServices {

  static Future signInUserService(SignUpEvent event) async {

    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
        url: EndPoints.verifyAndSignUp,
        body: json.encode({
          "verification_code": event.verificationCode,
          "name": event.fullName,
          "email": event.email,
          "mobile": event.phoneNumber,
          "gender": event.gender.name,
          "password": event.password,
          "password_confirmation": event.password
        })
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        return welcomeUserFromJson(helperResponse.response).data;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }
  static Future sendSMSVerificationCode(SendSMSEvent event) async {
   final response = await NetworkHelpers.postDataHelper(
        url: EndPoints.sendSMS,
        body: json.encode({
          "mobile": event.phoneNumber,
        }));
   print(response.response);
  }

// static Future loginUserService(LoginUserEvent event) async {
//   HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
//     url: EndPoints.login(user: event.phoneNumber, password: event.password),
//   );
//
//   if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
//     try {
//       return welcomeUserFromJson(helperResponse.response);
//     } catch (e) {
//       return helperResponse.copyWith(
//           servicesResponse: ServicesResponseStatues.modelError);
//     }
//   }
//
//   return helperResponse;
// }
}
