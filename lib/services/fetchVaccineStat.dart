import 'dart:convert';

import 'package:wounono_covid/models/covidStats.dart';
import 'package:http/http.dart' as http;
import 'package:wounono_covid/models/vaccineStat.dart';
import 'package:wounono_covid/utils/constants.dart';


Future<VaccineStat> fetchVaccineStat() async {
  final response = await http.get(Uri.parse(Constants.covidVaccineApiUrl));
  print('echo');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return VaccineStat.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');

  }
}