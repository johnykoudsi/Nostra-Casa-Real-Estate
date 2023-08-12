import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/data/models/user_model.dart';
import 'package:nostra_casa/utility/constant_logic_validations.dart';

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

      final response = await UserServices.editUserService(event);

      if (response is UserInfo) {
        print("asbhjdjksadksakasd1234567890-");
        UserModel? userModel = await getUserFromLocalStorage();

        if (userModel != null) {
          userModel.user = response;
          print("User Model${userModel.toJson()}");
          saveUserToLocalStorage(userModel);
          globalUserBloc.add(CheckUserFromLocalStorage());
        }
        emit(EditUserStatusState(
            helperResponse: HelperResponse(
                servicesResponse: ServicesResponseStatues.success,
            )));
      } else {
        emit(EditUserStatusState(helperResponse: response));
      }
    });
  }
}
