import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wounono_covid/models/airport_api/airport.dart';
import 'package:wounono_covid/models/country_api/country.dart';
import 'package:wounono_covid/models/covidStats.dart';
import 'package:http/http.dart' as http;
import 'package:wounono_covid/utils/constants.dart';


Future<List<Airport>> fetchAirportsList() async {
  return rootBundle.loadString('assets/data/airports.json')
      .then((jsonStr) => Airport.decode(jsonStr));
}


