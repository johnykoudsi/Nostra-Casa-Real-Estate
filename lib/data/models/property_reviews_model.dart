import 'dart:convert';

import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/data/models/user_model.dart';
import 'package:nostra_casa/utility/constant_logic_validations.dart';

WelcomeToPropertyReviews welcomeToPropertyReviewsFromJson(String str) =>
    WelcomeToPropertyReviews.fromJson(json.decode(str));

class WelcomeToPropertyReviews {
  WelcomeToPropertyReviews({this.propertyReviewsModel = const []});
  List<PropertyReviewsModel> propertyReviewsModel;
  factory WelcomeToPropertyReviews.fromJson(Map<String, dynamic> json) =>
      WelcomeToPropertyReviews(
          propertyReviewsModel: List<PropertyReviewsModel>.from(json["data"]
                  ["data"]
              .map((x) => PropertyReviewsModel.fromJson(x))));
}

class PropertyReviewsModel {
  int id;
  String rate;
  String review;
  int propertyId;
  UserInfo? user;
  DateTime? createdAt;
  PropertyReviewsModel({
    this.id = -1,
    this.rate = "-1",
    this.review = "",
    this.propertyId = -1,
    this.user,
    this.createdAt,
  });

  factory PropertyReviewsModel.fromJson(Map<String, dynamic> json) =>
      PropertyReviewsModel(
        id: json["id"],
        rate: json["rate"] ?? "0",
        review: json["review"] ?? "",
        propertyId: json["property_id"] ?? -1,
        user: json["user"] != null
            ? UserInfo.fromJson(json["user"])
            : (globalUserBloc.state as UserLoggedState).user.user,
        createdAt: DateTime.tryParse(json["created_at"]) ?? DateTime.now(),
      );
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
