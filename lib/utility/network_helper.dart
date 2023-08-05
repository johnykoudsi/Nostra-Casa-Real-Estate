import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/utility/app_routes.dart';

import '../data/models/user_model_local_storage.dart';
import 'constant_logic_validations.dart';
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
  static Future<HelperResponse> postDataHelper({
    required String url,
    body = "",
    bool useUserToken = false,
  }) async {
    try {
      Map<String, String> headers;
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      if (useUserToken) {
        final userState = globalUserBloc.state;

        if (userState is UserLoggedState) {
          headers['Authorization'] = "Bearer ${userState.user.accessToken}";
        }
      }

      var request;
      http.StreamedResponse response;

      request = http.Request('POST', Uri.parse(EndPoints.kMainUrl + url));

      request.headers.addAll(headers);
      request.body = body;

      response = await request.send();

      String streamRes = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        if (getStatuesFromResponse(streamRes)) {
          return HelperResponse(
            response: streamRes,
            servicesResponse: ServicesResponseStatues.success,
          );
        }
      }

      Map<String, dynamic> jsonError = json.decode(streamRes);

      if (response.statusCode == 401) {
        deleteUserFromLocal();
        globalNavigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppRoutes.welcome, (Route<dynamic> route) => false);
      }

      String? error = jsonError["message"];
      return HelperResponse(
        response: error ?? response.reasonPhrase ?? "",
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    } on SocketException catch (e) {
      return HelperResponse(
        servicesResponse: ServicesResponseStatues.networkError,
      );
    }
  }

  static Future<HelperResponse> postDataWithImage({
    required String url,
    required Map<String, String> body,
    bool useUserToken = false,
    List<File> filesPath = const[],
  }) async {
    try {
      Map<String, String> headers;
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      if (useUserToken) {
        final userState = globalUserBloc.state;

        if (userState is UserLoggedState) {
          headers['Authorization'] = "Bearer ${userState.user.accessToken}";
        }
      }

      var request =
      http.MultipartRequest('POST', Uri.parse(EndPoints.kMainUrl + url));

      request.headers.addAll(headers);

      request.fields.addAll(body);

      if (filesPath.isNotEmpty) {
        for (var element in filesPath) {
          request.files
              .add(await http.MultipartFile.fromPath('images', element.path));
        }
      }

      http.StreamedResponse response = await request.send();

      String streamRes = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        if (getStatuesFromResponse(streamRes)) {
          return HelperResponse(
            response: streamRes,
            servicesResponse: ServicesResponseStatues.success,
          );
        }
      }

      Map<String, dynamic> jsonError = json.decode(streamRes);

      if (response.statusCode == 401) {
        deleteUserFromLocal();
        globalNavigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppRoutes.welcome, (Route<dynamic> route) => false);
      }

      String? error = jsonError["message"];
      return HelperResponse(
        response: error ?? response.reasonPhrase ?? "",
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    } on SocketException catch (e) {
      return HelperResponse(
          servicesResponse: ServicesResponseStatues.networkError);
    }
  }

  static Future<HelperResponse> getDeleteDataHelper({
    required String url,
    body = "",
    bool useUserToken = false,
    String crud = "GET",
  }) async {
    try {
      Map<String, String> headers;
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      if (useUserToken) {
        final userState = globalUserBloc.state;

        if (userState is UserLoggedState) {
          headers['Authorization'] = "Bearer ${userState.user.accessToken}";
        }
      }

      var request = http.Request(crud, Uri.parse(EndPoints.kMainUrl + url));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String streamRes = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        if (getStatuesFromResponse(streamRes)) {
          return HelperResponse(
            response: streamRes,
            servicesResponse: ServicesResponseStatues.success,
          );
        }
      }

      Map<String, dynamic> jsonError = json.decode(streamRes);

      if (response.statusCode == 401) {
        deleteUserFromLocal();
        globalNavigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppRoutes.welcome, (Route<dynamic> route) => false);
      }

      String? error = jsonError["message"];
      return HelperResponse(
        response: error ?? response.reasonPhrase ?? "",
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    } on SocketException catch (e) {
      return HelperResponse(
          servicesResponse: ServicesResponseStatues.networkError);
    }
  }
}
