import 'dart:convert';

import 'package:wounono_covid/models/covidStats.dart';
import 'package:http/http.dart' as http;
import 'package:wounono_covid/utils/constants.dart';


Future<CovidStats> fetchCovidStat() async {
  final response = await http.get(Uri.parse(Constants.STATS_API_URL));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CovidStats.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}