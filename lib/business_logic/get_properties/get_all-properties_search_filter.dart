import 'package:nostra_casa/utility/constant_logic_validations.dart';

import '../../utility/enums.dart';

class GetAllPropertiesSearchFilter {
  GetAllPropertiesSearchFilter({this.page = 1,this.propertySorts = PropertySorts.suggested});
  int page;
  PropertySorts propertySorts;

  GetAllPropertiesSearchFilter copyWith({
    int? page,
    PropertySorts? propertySorts,
  }) =>
      GetAllPropertiesSearchFilter(
        page: page ?? this.page,
        propertySorts: propertySorts ?? this.propertySorts,
      );

  Map<String, String> toJson() => {
        "page": page.toString(),
        "per_page": kProductsGetLimit.toString(),
        "sort":propertySortsUBackEnd.reverse[propertySorts]??"owner-priority",
  };
}
