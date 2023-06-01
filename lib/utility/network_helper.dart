

import 'dart:convert';
import 'dart:io';

import 'endpoints.dart';
import 'enums.dart';
import 'package:http/http.dart' as http;
class HelperResponse {
  String response;
  ServicesResponseStatues servicesResponse;
  HelperResponse({this.response = '', required this.servicesResponse});

  HelperResponse copyWith({
    String? response,
    ServicesResponseStatues? servicesResponse,
  }) =>
      HelperResponse(
        response: response ?? this.response,
        servicesResponse: servicesResponse ?? this.servicesResponse,
      );
}

class NetworkHelpers {

  static Future<HelperResponse> getDataHelper({
    required String url,
    body,
    String? sessionToken,
  }) async {
    try {
      Map<String, String> headers;
      headers = {
        'X-Parse-Application-Id': "estore",
        'X-Parse-REST-API-Key': "GRU2FmjRzJJDhz7e",
        'Content-Type': 'application/json'
      };

      if (sessionToken != null) {
        headers['X-Parse-Session-Token'] = sessionToken;
      }

      var request = http.Request('GET', Uri.parse(EndPoints.kMainUrl + url));

      request.headers.addAll(headers);

      request.body = body;

      http.StreamedResponse response = await request.send();

      String streamRes = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        return HelperResponse(
            response: streamRes,
            servicesResponse: ServicesResponseStatues.success
        );
      } else {
        Map<String, dynamic> jsonError = json.decode(streamRes);

        if (jsonError.containsKey("code") && jsonError["code"] == 209) {
          //todo: delete user from local storage
        }
        String? error =  jsonError["error"];

        return HelperResponse(
            response: error ?? response.reasonPhrase ?? "",
            servicesResponse: ServicesResponseStatues.someThingWrong
        );
      }
    } on SocketException catch (e) {
      return HelperResponse(
          servicesResponse: ServicesResponseStatues.networkError
      );
    }
  }



}
