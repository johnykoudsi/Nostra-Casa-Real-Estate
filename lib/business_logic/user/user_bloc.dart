import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nostra_casa/utility/enums.dart';
import '../../data/models/user_model.dart';
import '../../data/models/user_model_local_storage.dart';
import '../../data/services/user_service.dart';
import '../../utility/network_helper.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInit()) {
    on<CheckUserFromLocalStorage>((event, emit) async {
      UserModel? user = await getUserFromLocalStorage();

      await Future.delayed(const Duration(milliseconds: 100));

      if (user != null) {
        emit(UserLoggedState(user: user));
      } else {
        emit(UserNotLoggedState());
      }

      add(AddFcmToken());
    });

    on<SignUpEvent>((event, emit) async {
      emit(UserLoading());

      final response = await UserServices.signInUserService(event);

      if (response is UserModel) {
        saveUserToLocalStorage(response);
        emit(UserLoggedState(user: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    on<SendSMSEvent>((event, emit) async {
      UserServices.sendSMSVerificationCode(event);
    });

    on<AddFcmToken>((event, emit) {
      // final userState = state;
      // if(userState is! UserLoggedState){
      //   return;
      // }
      FirebaseMessaging.instance.getToken().then((fcm) async {
        print('$fcm');
        FirebaseMessaging.instance.subscribeToTopic("Public");
        //add fcm to user
        // todo : send fcm service
      });
    });

    on<LoginUserEvent>((event, emit) async {
      emit(UserLoading());

      final response = await UserServices.loginUserService(event);

      if (response is UserModel) {
        saveUserToLocalStorage(response);
        emit(UserLoggedState(user: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    on<LogoutEvent>((event, emit) {
      UserServices.logoutUserService();
      deleteUserFromLocal();
      emit(UserNotLoggedState());
    });
  }
}
