// To parse this JSON data, do
//
//     final welcomeToPropertyReviews = welcomeToPropertyReviewsFromJson(jsonString);

import 'dart:convert';

WelcomeToPropertyReviews welcomeToPropertyReviewsFromJson(String str) => WelcomeToPropertyReviews.fromJson(json.decode(str));


class WelcomeToPropertyReviews {
  WelcomeToPropertyReviews({
    this.propertyReviewsModel = const[]
  });
  List<PropertyReviewsModel> propertyReviewsModel;
  factory WelcomeToPropertyReviews.fromJson(Map<String, dynamic> json) => WelcomeToPropertyReviews(
      propertyReviewsModel: List<PropertyReviewsModel>.from(json["data"]["data"].map((x) => PropertyReviewsModel.fromJson(x)))

  );

}


class PropertyReviewsModel {
  int id;
  String rate;
  dynamic review;
  int propertyId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  PropertyReviewsModel({
    required this.id,
    required this.rate,
    required this.review,
    required this.propertyId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory PropertyReviewsModel.fromJson(Map<String, dynamic> json) => PropertyReviewsModel(
    id: json["id"],
    rate: json["rate"],
    review: json["review"],
    propertyId: json["property_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );
}

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  DateTime smsVerifiedAt;
  dynamic smsVerificationCode;
  String mobile;
  dynamic facebook;
  String gender;
  dynamic dateOfBirth;
  int isBlocked;
  int priority;
  String? fcmToken;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.smsVerifiedAt,
    required this.smsVerificationCode,
    required this.mobile,
    required this.facebook,
    required this.gender,
    required this.dateOfBirth,
    required this.isBlocked,
    required this.priority,
    required this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    smsVerifiedAt: DateTime.parse(json["sms_verified_at"]),
    smsVerificationCode: json["sms_verification_code"],
    mobile: json["mobile"],
    facebook: json["facebook"],
    gender: json["gender"],
    dateOfBirth: json["date_of_birth"],
    isBlocked: json["is_blocked"],
    priority: json["priority"],
    fcmToken: json["fcm_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "sms_verified_at": smsVerifiedAt.toIso8601String(),
    "sms_verification_code": smsVerificationCode,
    "mobile": mobile,
    "facebook": facebook,
    "gender": gender,
    "date_of_birth": dateOfBirth,
    "is_blocked": isBlocked,
    "priority": priority,
    "fcm_token": fcmToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
class ReviewsSearchFilter {
  ReviewsSearchFilter({this.page = 1});
  int page;

  ReviewsSearchFilter copyWith({
    int? page,
  }) =>
      ReviewsSearchFilter(
        page: page ?? this.page,
      );
}