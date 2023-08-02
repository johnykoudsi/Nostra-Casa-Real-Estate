import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

UserBloc globalUserBloc = UserBloc();

const int kProductsGetLimit = 10;

bool userIsLoggedIn(BuildContext context){

  final state = context.read<UserBloc>().state;
  if(state is UserLoggedState){
    return true;
  }
  return false;
}
bool getStatuesFromResponse(String streamRes) {
  Map<String, dynamic> jsonError = json.decode(streamRes);
  if (jsonError.containsKey("success")) {
    return jsonError["success"];
  }
  return false;
}
