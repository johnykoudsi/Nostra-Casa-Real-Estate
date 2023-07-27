part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class CheckUserFromLocalStorage extends UserEvent {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends UserEvent {
  LoginUserEvent({required this.password, required this.phoneNumber});
  String phoneNumber;
  String password;

  @override
  List<Object?> get props => [phoneNumber, password];
}

class SendSMSEvent extends UserEvent {
  SendSMSEvent({required this.phoneNumber});
  String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class SignUpEvent extends UserEvent {
  SignUpEvent(
      {required this.password,
      required this.phoneNumber,
      required this.email,
      required this.fullName,
      required this.gender,
      required this.verificationCode});
  String phoneNumber;
  String password;
  String email;
  String fullName;
  Gender gender;
  String verificationCode;

  Map<String, dynamic> toJson() => {
        "verification_code": verificationCode,
        "name": fullName,
        "email": email,
        "mobile": phoneNumber,
        "gender": gender.name,
        "password": password,
        "password_confirmation": password,
      };

  @override
  List<Object?> get props =>
      [phoneNumber, password, email, fullName, gender, verificationCode];
}

class AddFcmToken extends UserEvent{

  @override
  List<Object?> get props => [];

}