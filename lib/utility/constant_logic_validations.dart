import 'dart:convert';

import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

bool getStatuesFromResponse(String streamRes) {
  Map<String, dynamic> jsonError = json.decode(streamRes);
  if (jsonError.containsKey("success")) {
    return jsonError["success"];
  }
  return false;
}
