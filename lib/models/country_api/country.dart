import 'dart:convert';

class ApiCountry {
  final String name;
  final String alpha2Code;
  final String alpha3Code;
  final String nativeName;
  final String flag;
  final Map translations;

  ApiCountry({this.name, this.alpha2Code, this.alpha3Code, this.nativeName, this.flag, this.translations});

  factory ApiCountry.fromJson(Map<String, dynamic> json) {
    return ApiCountry(
      name: json['name'],
      alpha2Code: json['alpha2Code'],
      alpha3Code: json['alpha3Code'],
      nativeName: json['nativeName'],
      flag: json['flag'],
      translations: json['translations']
    );
  }


  static Map<String, dynamic> toMap(ApiCountry country) => {
    'name': country.name,
    'alpha2Code': country.alpha2Code,
    'alpha3Code': country.alpha3Code,
    'nativeName': country.nativeName,
    'flag': country.flag,
    'translations': country.translations,
  };

  static String encode(List<ApiCountry> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((music) => ApiCountry.toMap(music))
        .toList(),
  );

  static List<ApiCountry> decode(String countries) =>
      (json.decode(countries) as List<dynamic>)
          .map<ApiCountry>((item) => ApiCountry.fromJson(item))
          .toList();




}