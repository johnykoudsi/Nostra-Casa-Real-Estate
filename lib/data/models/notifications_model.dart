// To parse this JSON data, do
//
//     final welcomeToMyNotifications = welcomeToMyNotificationsFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

WelcomeToMyNotifications welcomeToMyNotificationsFromJson(String str) => WelcomeToMyNotifications.fromJson(json.decode(str));

String welcomeToMyNotificationsToJson(WelcomeToMyNotifications data) => json.encode(data.toJson());

class WelcomeToMyNotifications {
  bool success;
  Data data;
  String message;
  int status;

  WelcomeToMyNotifications({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  factory WelcomeToMyNotifications.fromJson(Map<String, dynamic> json) => WelcomeToMyNotifications(
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
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int id;
  dynamic createdAt;
  dynamic updatedAt;
  int userId;
  int notificationId;
  UserNotification notification;

  Datum({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.notificationId,
    required this.notification,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    userId: json["user_id"],
    notificationId: json["notification_id"],
    notification: UserNotification.fromJson(json["notification"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "user_id": userId,
    "notification_id": notificationId,
    "notification": notification.toJson(),
  };
}

class UserNotification extends Equatable{
  int id;
  String head;
  String body;
  dynamic createdAt;
  dynamic updatedAt;

  UserNotification({
    required this.id,
    required this.head,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) => UserNotification(
    id: json["id"],
    head: json["head"],
    body: json["body"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "head": head,
    "body": body,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };

  @override

  List<Object?>  get props => [id, head, body];
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
class NotificationsSearchFilter {
  NotificationsSearchFilter({this.page = 1});
  int page;

  NotificationsSearchFilter copyWith({
    int? page,
  }) =>
      NotificationsSearchFilter(
        page: page ?? this.page,
      );
}