import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/flutter_skeleton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wounono_covid/models/country_api/country.dart';
import 'package:wounono_covid/services/fetchCountryList.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/diplay_error_toast.dart';
import 'package:wounono_covid/widgets/app_bar/in_page_app_bar.dart';
import 'package:async/async.dart';
import 'dart:developer';


class CountryList extends StatefulWidget {

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {


  Future<List<ApiCountry>> futureCountries;

  List<ApiCountry> storedCountries;


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
            builder: (context, snapshot){
              var countries;
              if(storedCountries != null){
                print('stored');
                print(storedCountries);
                countries = storedCountries;
              }else{
                print("api");
                print(snapshot.data);
                countries = snapshot.data;
              }
              print("list");
              print(countries);
              if(countries != null){
                return Column(
                  children: [
                    SizedBox(
                      height: kToolbarHeight / 4,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                      ),
                      child: _dataView(countries),
                    ),
                  ],
                );
              }
              return _defaultView();
            },
          ),
        ),
      ),

    );
  }

  Widget _dataView(List<ApiCountry>countries){
    return  ListView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (builder, index) {
        return Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(5.0),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: ScreenUtil().setWidth(20.0),
                            height: ScreenUtil().setHeight(20.0),
                            child: SvgPicture.network(
                              countries[index].flag,
                              placeholderBuilder: (BuildContext context) => Container(
                                  child: const CircularProgressIndicator(
                                    color: Color(0xff3d8e33),
                                    strokeWidth: 1.0,
                                  )),
                            )
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(5.0),
                        ),
                        Flexible(
                            child:Text(
                                countries[index].name
                            )
                        ),


                      ],
                    ),
                  ],
                )
            ),
            SizedBox(
              height: ScreenUtil().setHeight(5.0),
            ),
          ],
        );

      },
      itemCount: countries.length,
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
    final String countriesString = await sharedCountries.getString('countries');

    if(countriesString != null){
      setState(() {
        storedCountries =  ApiCountry.decode(countriesString);
      });
    }else{
      await fetchCountryList();
      setState(() {
        futureCountries =  fetchCountryList();
      });
    }


  }



}
