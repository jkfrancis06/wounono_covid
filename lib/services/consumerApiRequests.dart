
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wounono_covid/models/consumer.dart';
import 'package:wounono_covid/utils/apiConstants.dart';

Future signUpConsumer(Consumer consumer) async {
  var url = ApiConstants.SERVER_ADDRESS+ApiConstants.CONSUMER_SIGN_IN;
  print(url);
  print(jsonEncode(consumer.toJson()));
  final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(consumer.toJson()),
  );
  print(response.body);
  if (response.statusCode == 201) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}
