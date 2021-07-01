import 'package:flutter/foundation.dart';

class CovidStats {
  final int updated;
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;

  CovidStats({
    this.updated,
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
  });


  factory CovidStats.fromJson(Map<String, dynamic> json) {
    return CovidStats(
        updated: json['updated'],
        country: json['country'],
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        recovered: json['recovered'],
        todayRecovered: json['todayRecovered'],
        active: json['active'],
    );
  }


}