part of 'edit_user_bloc.dart';

abstract class EditUserEvent extends Equatable {
  const EditUserEvent();
}
class EditUserApiEvent extends EditUserEvent {
  EditUserApiEvent(
      {
        required this.phoneNumber,
        required this.email,
        required this.fullName,
        required this.gender,
        required this.facebook
      });
  String phoneNumber;
  String email;
  String fullName;
  Gender gender;
  String facebook;


  Map<String, dynamic> toJson() => {

    "name": fullName,
    "email": email,
    "mobile": phoneNumber,
    "gender": gender.name,
    "facebook":facebook,
  };

  @override
  List<Object?> get props =>
      [phoneNumber, email, fullName, gender,facebook];
}