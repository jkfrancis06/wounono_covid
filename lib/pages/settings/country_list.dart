import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_skeleton/flutter_skeleton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wounono_covid/models/country_api/country.dart';
import 'package:wounono_covid/services/fetchCountryList.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/diplay_error_toast.dart';
import 'package:wounono_covid/widgets/app_bar/in_page_app_bar.dart';
import 'package:async/async.dart';



class CountryList extends StatefulWidget {

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {

  Future<List<ApiCountry>> futureCountries;
  final _countriesMemoizer = AsyncMemoizer<List<ApiCountry>>();


  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();




  @override
  void initState() {
    super.initState();
    _getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: in_page_app_bar(context, 'Nationalité'),
      body: Container(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: futureCountries,
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
              print(snapshot.hasData);
              return Text('Test');
            },
          ),
        ),
      ),

    );
  }


  Widget _defaultView(){
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight / 4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child:  CardSkeleton(
            style: SkeletonStyle(
              theme: SkeletonTheme.Light,
              isShowAvatar: true,
              isCircleAvatar: true,
              borderRadius: BorderRadius.all(Radius.circular(11.0)),
              padding: EdgeInsets.all(32.0),
              backgroundColor: Colors.white,
              barCount: 0,
              isAnimation: true,
            ),
          ),
        ),

      ],
    );
  }




  Future<void> _getCountries() async {

    final SharedPreferences sharedCountries = await _prefs;

    if(sharedCountries.getString('countries') != null){
      setState(() {
        futureCountries =  jsonDecode(sharedCountries.getString('countries'));
      });
    }else{
      await fetchCountryList();
      setState(() {
        futureCountries =  fetchCountryList();
      });
    }


  }



}
