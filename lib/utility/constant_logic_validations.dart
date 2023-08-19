import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/utility/enums.dart';

import '../data/models/properties_model.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

UserBloc globalUserBloc = UserBloc();

const int kProductsGetLimit = 10;
const int kTagGetLimit = 20;

const double mapRadius = 200;
bool isEnglish(BuildContext context){
  if(context.locale.languageCode == "ar"){
    return false;
  }
  return true;
}
bool userIsLoggedIn(BuildContext context){

  final state = context.read<UserBloc>().state;
  if(state is UserLoggedState){
    return true;
  }
  return false;
}
int changePropertyIdToPropertyTypeId(Property property){
if(property.residential != null ){
  return property.residential!.id;
}else if(property.commercial != null){
  return property.commercial!.id;
}else if(property.agricultural != null){
  return property.agricultural!.id;
}
 return -1;
}
bool getStatuesFromResponse(String streamRes) {
  Map<String, dynamic> jsonError = json.decode(streamRes);
  if (jsonError.containsKey("success")) {
    return jsonError["success"];
  }
  return false;
}
