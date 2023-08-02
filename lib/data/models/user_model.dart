import 'dart:convert';

import '../../utility/enums.dart';

WelcomeUser welcomeUserFromJson(String str) => WelcomeUser.fromJson(json.decode(str));

String welcomeUserToJson(WelcomeUser data) => json.encode(data.toJson());

class WelcomeUser {
  UserModel data;

  WelcomeUser({
    required this.data,
  });
  

  factory WelcomeUser.fromJson(Map<String, dynamic> json) => WelcomeUser(
    data: UserModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class UserModel {
  UserInfo user;
  String accessToken;

  UserModel({
    required this.user,
    required this.accessToken,
  });

  UserModel copyWith({
    UserInfo? user,
    String? accessToken,
  }) =>
      UserModel(
        user: user ?? this.user,
        accessToken: accessToken ?? this.accessToken,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    user:json["user"] !=null ? UserInfo.fromJson(json["user"]) : UserInfo(id: 0),
    accessToken: json["access_token"]??"",
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "access_token": accessToken,
  };
}

class UserInfo {
  int id;
  String name;
  String email;
  String mobile;
  String facebook;
  Gender gender;
  DateTime? dateOfBirth;


  UserInfo({
    required this.id,
    this.name="",
    this.email="",
    this.mobile="",
    this.facebook="",
    this.gender = Gender.female,
    this.dateOfBirth,
  });

  UserInfo copyWith({
    int? id,
    String? name,
    String? email,
    String? mobile,
    String? facebook,
    Gender? gender,
    DateTime? dateOfBirth,
  }) =>
      UserInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        facebook: facebook ?? this.facebook,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      );

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    name: json["name"]??"",
    email: json["email"]??'',
    mobile: json["mobile"]??'',
    facebook: json["facebook"]??'',
    gender: genderValues.map[json['gender']] ?? Gender.female,
    dateOfBirth: DateTime.tryParse(json["date_of_birth"].toString()),
  );

  Map<String, dynamic> toJson() => {
     "id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "facebook": facebook,
    "gender": gender.name,
    "date_of_birth": dateOfBirth,
  };
}
