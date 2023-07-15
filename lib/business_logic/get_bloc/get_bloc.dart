import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/data/models/GetRequestModel.dart';
import 'package:nostra_casa/utility/network_helper.dart';

import '../../utility/enums.dart';

part 'get_event.dart';
part 'get_state.dart';

class GetBloc extends Bloc<GetEvent, GetState> {
  GetBloc() : super(GetLoading()) {
    on<GetRequestApiEvent>((event, emit) async {
      emit(GetLoading());

      var getRequest;

      if (event.getRequestType == GetRequestType.contactInfo) {

      }

      if (getRequest is GetRequestModel) {
        emit(GetDone(getRequestModel: getRequest));
      }

      if (getRequest is HelperResponse) {
        emit(GetError(
            servicesResponseStatues: getRequest.servicesResponse,
            error: getRequest.response));
      }
    });
  }
}
