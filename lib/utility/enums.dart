

enum ServicesResponseStatues {
  success,
  networkError,
  savedToLocal,
  someThingWrong,
  modelError,
  wrongData,
  locationError,
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

enum GetRequestType{
  contactInfo,
}


class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
