import 'dart:convert';

WelcomeToRequestStatus welcomeToRequestStatusFromJson(String str) => WelcomeToRequestStatus.fromJson(json.decode(str));

String welcomeToRequestStatusToJson(WelcomeToRequestStatus data) => json.encode(data.toJson());

class WelcomeToRequestStatus {
  bool success;
  StatusData data;
  String message;
  int status;

  WelcomeToRequestStatus({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  factory WelcomeToRequestStatus.fromJson(Map<String, dynamic> json) => WelcomeToRequestStatus(
    success: json["success"],
    data: StatusData.fromJson(json["data"]),
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

class StatusData {
  String status;

  StatusData({
    required this.status,
  });

  factory StatusData.fromJson(Map<String, dynamic> json) => StatusData(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}