import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

      await Future.delayed(const Duration(seconds: 3));

      if (user != null) {
        emit(UserLoggedState(user: user));
      } else {
        emit(UserNotLoggedState());
      }
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

    // on<LoginUserEvent>((event, emit) async {
    //   emit(UserLoading());
    //
    //   final response = await UserService.loginUserService(event);
    //
    //   if (response is UserInfo) {
    //     add(SaveUserToLocal(user: response));
    //     emit(UserLoggedState(user: response));
    //   } else {
    //     emit(UserErrorState(helperResponse: response));
    //   }
    // });

    // on<LogOutEvent>((event, emit) {
    //   print("log out");
    //   final userState = event.userState;
    //   if (userState is UserLoggedState) {
    //     NetworkHelpers.postDataHelper(
    //       url: EndPoints.logout,
    //       sessionToken: userState.user.sessionToken,
    //     );
    //   }
    //
    //   emit(UserNotLoggedState());
    // });
    //
    // on<SaveUserToLocal>((event, emit) async {
    //   final SharedPreferences prefs = await SharedPreferences.getInstance();
    //   await prefs.setString('user', welcomeUserToJson(event.user));
    // });
  }
}
