import 'dart:convert';

import 'package:wounono_covid/models/country_api/country.dart';
import 'package:wounono_covid/models/covidStats.dart';
import 'package:http/http.dart' as http;
import 'package:wounono_covid/utils/constants.dart';


Future<List<ApiCountry>> fetchCountryList() async {
  final response = await http.get(Uri.parse(Constants.COUNTRY_LIST_API));


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON
    return ApiCountry.decode(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}