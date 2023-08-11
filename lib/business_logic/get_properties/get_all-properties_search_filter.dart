

class GetAllPropertiesSearchFilter {
  GetAllPropertiesSearchFilter({this.page = 1});
  int page;

  GetAllPropertiesSearchFilter copyWith({
    int? page,
  }) =>
      GetAllPropertiesSearchFilter(
        page: page ?? this.page,
      );
}
