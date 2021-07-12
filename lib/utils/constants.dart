import 'dart:ffi';

import 'package:flutter/material.dart';

class Constants {
  static final Color primaryColor = const Color(0xff3d8e33);
  static final Color scaffoldBackgroundColor = Color.fromRGBO(
      245, 247, 249, 1.0);
  static final Color blueColor = Color(0xff3a75c4);
  static final  defaultFontColor = 17.0;
  static final  leadingFontSize = 18.0;
  static final String appName = "Unono covid-19".toUpperCase();


  static final String STATS_API_URL = "https://disease.sh/v3/covid-19/countries/KM?strict=true";
  static final String VACCINE_API_URL = "https://disease.sh/v3/covid-19/vaccine/coverage/countries/Comoros?lastdays=1&fullData=false";
  static final String COUNTRY_LIST_API = "https://restcountries.eu/rest/v2/all";

}
