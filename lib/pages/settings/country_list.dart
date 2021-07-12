import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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

  ApiCountry selectedCountry;


  @override
  void initState() {
    super.initState();
    _getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    FlutterIcons.keyboard_backspace_mdi,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Text(
                  'Nationalité',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(18)
                  ),
                )
              ]
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0,0,5,0),
            child: Row(
              children: [
                OutlinedButton(
                    onPressed: (){
                      Navigator.pop(context, selectedCountry);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.black,
                    )
                )
              ],
            ),
          )
        ],
        backgroundColor: Constants.scaffoldBackgroundColor,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: futureCountries,
                builder: (context, snapshot){
                  var countries;
                  if(storedCountries != null){
                    countries = storedCountries;
                  }else{
                    countries = snapshot.data;
                  }
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
            ],
          )
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
            Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child:  Row(
                                children: [
                                  Container(
                                      width: ScreenUtil().setWidth(20.0),
                                      height: ScreenUtil().setHeight(20.0),
                                      child: SvgPicture.network(
                                        countries[index].flag
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
                            ),

                            _buildSelectIcon(countries[index])
                          ],
                        ),
                      ],
                    )
                ),
                Positioned.fill(
                    child: new Material(
                        color: Colors.transparent,
                        child: new InkWell(
                          borderRadius: BorderRadius.circular(11.0),
                          onTap: () => {
                            _updateSelectedCountry(countries[index])
                          },
                        )
                    )
                )
              ],
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

  Widget _buildSelectIcon(ApiCountry listCountry) {
    if (listCountry == selectedCountry) {
      return Container(
        width: MediaQuery.of(context).size.width*0.1,
        child: Icon(
          Icons.check_circle,
          color: Constants.primaryColor,
        ),
      );
    } else {
      return Container();
    }
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
      await fetchCountryList().catchError((e){
        showErrorToast('Network error. Try again later');
      });
      setState(() {
        futureCountries =  fetchCountryList();
      });
    }
  }

  _updateSelectedCountry(ApiCountry selected){
    setState(() {
      selectedCountry = selected;
    });
  }

  _validateSelectedCountry(context){
    Navigator.pop(context, selectedCountry);
  }



}
