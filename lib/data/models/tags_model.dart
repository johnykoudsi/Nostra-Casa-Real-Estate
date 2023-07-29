import 'dart:convert';

import 'package:equatable/equatable.dart';

WelcomeTags welcomeTagsFromJson(String str) =>
    WelcomeTags.fromJson(json.decode(str));

class WelcomeTags {
  List<Tag> tags;

  WelcomeTags({
    required this.tags,
  });

  factory WelcomeTags.fromJson(Map<String, dynamic> json) =>
      WelcomeTags(
        tags: List<Tag>.from(
            json["data"]["data"].map((x) => Tag.fromJson(x))),
      );
}

class Tag extends Equatable{
  int id;
  String name;
  String description;
  int active;
  dynamic tagTypeId;

  Tag({
    this.id = -1,
    this.name = "",
    this.description = "",
    this.active = 0,
    this.tagTypeId,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"] ?? -1,
    name: json["name"] ?? '',
    description: json["description"] ?? '',
    active: json["active"] ?? 0,
    tagTypeId: json["tag_type_id"],
  );

  @override
  List<Object?> get props => [id,name,description,active,tagTypeId];
}

class TagsSearchFilter {
  TagsSearchFilter({this.page = 1});
  int page;

  TagsSearchFilter copyWith({
    int? page,
  }) =>
      TagsSearchFilter(
        page: page ?? this.page,
      );
}
