import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wounono_covid/models/country_api/country.dart';
import 'package:wounono_covid/models/covidStats.dart';
import 'package:http/http.dart' as http;
import 'package:wounono_covid/utils/constants.dart';


Future<List<ApiCountry>> fetchCountryList() async {
  final response = await http.get(Uri.parse(Constants.COUNTRY_LIST_API));
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON
    var data = ApiCountry.decode(response.body);
    final SharedPreferences sharedCountries = await _prefs;
    await sharedCountries.setString('countries', ApiCountry.encode(data));
    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}