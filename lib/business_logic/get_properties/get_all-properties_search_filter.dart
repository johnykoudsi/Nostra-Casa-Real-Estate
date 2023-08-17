import 'package:nostra_casa/utility/constant_logic_validations.dart';

import '../../utility/enums.dart';
import '../user/user_bloc.dart';

class GetAllPropertiesSearchFilter {
  GetAllPropertiesSearchFilter({
    this.page = 1,
    this.propertySorts = PropertySorts.suggested,
    this.propertyType = PropertyType.all,
    this.term = "",
    this.propertyService = PropertyService.all,
    this.myFavorite = false,
    this.myProperties = false,
    this.tagsId = -1,
  });
  int page;
  PropertySorts propertySorts;
  PropertyType propertyType;
  PropertyService propertyService;
  String term;
  bool myProperties;
  bool myFavorite;
  int tagsId;

  GetAllPropertiesSearchFilter copyWith({
    int? page,
    PropertySorts? propertySorts,
    PropertyType? propertyType,
    PropertyService? propertyService,
    String? term,
    bool? myProperties,
    bool? myFavorite,
    int? tagsId,
  }) =>
      GetAllPropertiesSearchFilter(
          page: page ?? this.page,
          propertySorts: propertySorts ?? this.propertySorts,
          propertyType: propertyType ?? this.propertyType,
          term: term ?? this.term,
          propertyService: propertyService ?? this.propertyService,
          myFavorite: myFavorite ?? this.myFavorite,
          myProperties: myProperties ?? this.myProperties,
          tagsId: tagsId ?? this.tagsId,
      );

  Map<String, String> toJson() {
    String getUserId() {
      final userState = globalUserBloc.state;
      if (userState is UserLoggedState) {
        return userState.user.user.id.toString();
      }
      return "";
    }

    Map<String, String> map = {
      "page": page.toString(),
      "filter[tags]": tagsId != -1?tagsId.toString():"",
      "filter[property-type]": propertyTypeBackEnd2.reverse[propertyType] ?? '',
      "per_page": kProductsGetLimit.toString(),
      "sort": propertySortsUBackEnd.reverse[propertySorts] ?? "owner-priority",
      "filter[term]": term,
      "filter[my-favorites]": myFavorite ? getUserId() : "",
      "filter[my-properties]": myProperties ? getUserId() : "",
      "filter[property-service]":
          propertyServiceBackEnd1.reverse[propertyService] ?? '',
    }..removeWhere((key, value) => value.isEmpty);
    return map;
  }
}
