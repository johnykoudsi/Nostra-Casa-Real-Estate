import 'package:nostra_casa/utility/constant_logic_validations.dart';

import '../../utility/enums.dart';

class GetAllPropertiesSearchFilter {
  GetAllPropertiesSearchFilter({
    this.page = 1,
    this.propertySorts = PropertySorts.suggested,
    this.propertyType = PropertyType.all,
    this.term = "",
    this.propertyService = PropertyService.all,
  });
  int page;
  PropertySorts propertySorts;
  PropertyType propertyType;
  PropertyService propertyService;
  String term;

  GetAllPropertiesSearchFilter copyWith({
    int? page,
    PropertySorts? propertySorts,
    PropertyType? propertyType,
    PropertyService? propertyService,
    String? term,
  }) =>
      GetAllPropertiesSearchFilter(
        page: page ?? this.page,
        propertySorts: propertySorts ?? this.propertySorts,
        propertyType: propertyType ?? this.propertyType,
        term: term ?? this.term,
        propertyService:propertyService ?? this.propertyService,
      );

  Map<String, String> toJson() => {
        "page": page.toString(),
        "filter[property-type]":
            propertyTypeBackEnd2.reverse[propertyType] ?? '',
        "per_page": kProductsGetLimit.toString(),
        "sort":
            propertySortsUBackEnd.reverse[propertySorts] ?? "owner-priority",
        "filter[term]": term,
    "filter[property-service]":propertyServiceBackEnd1.reverse[propertyService] ?? '',
      }..removeWhere((key, value) => value.isEmpty);
}
