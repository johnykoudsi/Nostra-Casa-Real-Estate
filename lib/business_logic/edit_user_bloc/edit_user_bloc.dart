import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/data/models/user_model.dart';

import '../../data/models/user_model_local_storage.dart';
import '../../data/services/user_service.dart';
import '../../utility/enums.dart';
import '../../utility/network_helper.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {

  EditUserBloc() : super(EditUserInitial()) {
    on<EditUserApiEvent>((event, emit) async {
      emit(EditUserLoadingState());

      HelperResponse response = await UserServices.editUserService(event);

      if(response.servicesResponse == ServicesResponseStatues.success){
        emit(EditUserDoneState());
      }else{
        emit(EditUserErrorState(helperResponse: response));
      }
      // if (response is UserModel) {
      //   //saveUserToLocalStorage(response);
      //   emit(EditUserDoneState());
      // } else {
      //  emit(UserErrorState(helperResponse: response));
      // }
    });

  }
}