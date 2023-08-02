

enum ServicesResponseStatues {
  success,
  networkError,
  savedToLocal,
  someThingWrong,
  modelError,
  wrongData,
  locationError,
}
enum PropertyType {
  residential,
  agricultural,
  commercial,
}

enum PropertyService {
  sale,
  rent,
  holiday,
}
final serviceValues = EnumValues({
  "Sent Successfully" : ServicesResponseStatues.success,
  "Connection error !": ServicesResponseStatues.networkError,
  "Something went wrong !": ServicesResponseStatues.someThingWrong,
  "Failed to parse model !": ServicesResponseStatues.modelError,
  "Data sent is not correct !":ServicesResponseStatues.wrongData,
  "The form is saved locally":ServicesResponseStatues.savedToLocal,
  "No Location Permission !":ServicesResponseStatues.locationError
});

final propertyType = EnumValues({
  "residential" : PropertyType.residential,
  "agricultural": PropertyType.agricultural,
  "commercial": PropertyType.commercial,
});
final propertyService = EnumValues({
  "Sent Successfully" : PropertyService.sale,
  "Connection error !": PropertyService.rent,
  "Something went wrong !": PropertyService.holiday,
});

enum GetRequestType{
  contactInfo,
}
enum Gender { male, female }
final genderValues = EnumValues({
  "male": Gender.male,
  "female": Gender.female,
});


class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
