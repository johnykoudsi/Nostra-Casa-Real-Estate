import 'dart:convert';

WelcomeAgriculturals welcomeAgriculturalsFromJson(String str) => WelcomeAgriculturals.fromJson(json.decode(str));

String welcomeAgriculturalsToJson(WelcomeAgriculturals data) => json.encode(data.toJson());

class WelcomeAgriculturals {
  bool success;
  Data data;
  String message;
  int status;

  WelcomeAgriculturals({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  factory WelcomeAgriculturals.fromJson(Map<String, dynamic> json) => WelcomeAgriculturals(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  String specialAttributes;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  int propertyId;
  Property property;

  Data({
    required this.specialAttributes,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.propertyId,
    required this.property,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    specialAttributes: json["specialAttributes"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    propertyId: json["property_id"],
    property: Property.fromJson(json["property"]),
  );

  Map<String, dynamic> toJson() => {
    "specialAttributes": specialAttributes,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "property_id": propertyId,
    "property": property.toJson(),
  };
}

class Property {
  String name;
  String area;
  String price;
  String description;
  String latitude;
  String longitude;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  int userId;
  User user;

  Property({
    required this.name,
    required this.area,
    required this.price,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.userId,
    required this.user,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    name: json["name"],
    area: json["area"],
    price: json["price"],
    description: json["description"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    userId: json["user_id"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "area": area,
    "price": price,
    "description": description,
    "latitude": latitude,
    "longitude": longitude,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "user_id": userId,
    "user": user.toJson(),
  };
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
  dynamic priority;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.smsVerifiedAt,
    this.smsVerificationCode,
    required this.mobile,
    this.facebook,
    required this.gender,
    this.dateOfBirth,
    required this.isBlocked,
    this.priority,
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
