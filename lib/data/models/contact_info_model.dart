import 'dart:convert';
import 'package:nostra_casa/data/models/GetRequestModel.dart';


WelcomeAbout welcomeAboutFromJson(String str) => WelcomeAbout.fromJson(json.decode(str));

String welcomeAboutToJson(WelcomeAbout data) => json.encode(data.toJson());

class WelcomeAbout extends GetRequestModel{
  List<About> results;

  WelcomeAbout({
    required this.results,
  });

  factory WelcomeAbout.fromJson(Map<String, dynamic> json) => WelcomeAbout(
    results: List<About>.from(json["results"].map((x) => About.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class About {

  String objectId;
  String phoneNumber;
  String aboutAr;


  About({
    required this.objectId,
    this.phoneNumber ='',
    this.aboutAr = '',
  });

  factory About.fromJson(Map<String, dynamic> json) => About(
    objectId: json["objectId"],
    phoneNumber: json["phoneNumber"]??'',
    aboutAr: json["about_ar"]??'',
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "phoneNumber": phoneNumber,
    "about_ar": aboutAr,
  };
}
