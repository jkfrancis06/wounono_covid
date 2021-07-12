import 'dart:convert';

class Airport {
  final String name;
  final String city;
  final String country;
  final String iata_code;
  final String objectID;
  final int links_count;

  Airport({this.name, this.city, this.country, this.iata_code, this.objectID,this.links_count});



  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
        name: json['name'],
        city: json['city'],
        country: json['country'],
        iata_code: json['iata_code'],
        objectID: json['objectID'],
        links_count: json['links_count'],
    );
  }


  static Map<String, dynamic> toMap(Airport country) => {
    'name': country.name,
    'city': country.city,
    'country': country.country,
    'iata_code': country.iata_code,
    'objectID': country.objectID,
    'links_count': country.links_count,
  };

  static String encode(List<Airport> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((music) => Airport.toMap(music))
        .toList(),
  );

  static List<Airport> decode(String airports) =>
      (json.decode(airports) as List<dynamic>)
          .map<Airport>((item) => Airport.fromJson(item))
          .toList();

}