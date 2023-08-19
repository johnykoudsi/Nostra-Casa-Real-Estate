// To parse this JSON data, do
//
//     final welcomeToMyPropertyRate = welcomeToMyPropertyRateFromJson(jsonString);

import 'dart:convert';

WelcomeToMyPropertyRate welcomeToMyPropertyRateFromJson(String str) => WelcomeToMyPropertyRate.fromJson(json.decode(str));

String welcomeToMyPropertyRateToJson(WelcomeToMyPropertyRate data) => json.encode(data.toJson());

class WelcomeToMyPropertyRate {
  bool success;
  List<MyRate> data;
  dynamic message;
  int status;

  WelcomeToMyPropertyRate({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  factory WelcomeToMyPropertyRate.fromJson(Map<String, dynamic> json) => WelcomeToMyPropertyRate(
    success: json["success"],
    data: List<MyRate>.from(json["data"].map((x) => MyRate.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class MyRate {
  int id;
  String rate;
  String review;
  int propertyId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  MyRate({
    required this.id,
    required this.rate,
    required this.review,
    required this.propertyId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyRate.fromJson(Map<String, dynamic> json) => MyRate(
    id: json["id"],
    rate: json["rate"],
    review: json["review"],
    propertyId: json["property_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rate": rate,
    "review": review,
    "property_id": propertyId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
