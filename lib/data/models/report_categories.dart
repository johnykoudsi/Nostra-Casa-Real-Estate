import 'dart:convert';

WelcomeReportCategories welcomeReportCategoriesFromJson(String str) => WelcomeReportCategories.fromJson(json.decode(str));


class WelcomeReportCategories {
  List<ReportCategory> data;

  WelcomeReportCategories({
    required this.data,
  });

  factory WelcomeReportCategories.fromJson(Map<String, dynamic> json) => WelcomeReportCategories(
    data: List<ReportCategory>.from(json["data"].map((x) => ReportCategory.fromJson(x))),
  );
}

class ReportCategory {
  int id;
  String name;

  ReportCategory({
    this.id = -1,
    this.name = "",
  });

  factory ReportCategory.fromJson(Map<String, dynamic> json) => ReportCategory(
    id: json["id"]??-1,
    name: json["name"]??"",
  );
}
