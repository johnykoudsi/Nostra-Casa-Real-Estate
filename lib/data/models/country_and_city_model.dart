import 'dart:convert';

WelcomeCountryAndCity welcomeCountryAndCityFromJson(String str) => WelcomeCountryAndCity.fromJson(json.decode(str));


class WelcomeCountryAndCity {
  List<CountryModel> country;

  WelcomeCountryAndCity({
    required this.country,
  });

  factory WelcomeCountryAndCity.fromJson(Map<String, dynamic> json) => WelcomeCountryAndCity(
    country: List<CountryModel>.from(json["data"].map((x) => CountryModel.fromJson(x))),
  );


}


class CountryModel {
  String name;
  int id;
  List<City> cities;

  CountryModel({
    this.name = "",
    this.id = -1,
    this.cities = const[],
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    name: json["name"]??"",
    id: json["id"]??-1,
    cities: List<City>.from(json["cities"]?.map((x) => City.fromJson(x)) ?? []),
  );

}

class City {
  int id;
  String name;

  City({
    this.id = -1,
    this.name = "",
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"]??'',
    name: json["name"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}