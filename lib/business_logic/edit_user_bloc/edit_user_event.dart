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
          this.facebook,
         this.dateOfBirth,

      });
  String phoneNumber;
  String email;
  String fullName;
  Gender gender;
  String? facebook;
  String? dateOfBirth;


  Map<String, dynamic> toJson() {
    final json = {
      "name": fullName,
      "email": email,
      "mobile": phoneNumber,
      "gender": gender.name,
      "facebook": facebook,
      "date_of_birth": dateOfBirth,
    };
    json.removeWhere((key, value) => value==null||value ==""||value.isEmpty);
    return json;
  }

  @override
  List<Object?> get props =>
      [phoneNumber, email, fullName, gender,facebook,dateOfBirth];
}