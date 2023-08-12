import 'package:nostra_casa/utility/constant_logic_validations.dart';

class GetAllPropertiesSearchFilter {
  GetAllPropertiesSearchFilter({this.page = 1});
  int page;

  GetAllPropertiesSearchFilter copyWith({
    int? page,
  }) =>
      GetAllPropertiesSearchFilter(
        page: page ?? this.page,
      );

  Map<String, String> toJson() => {
        "page": page.toString(),
        "per_page": kProductsGetLimit.toString(),
      };
}
