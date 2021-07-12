import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:wounono_covid/models/airport_api/airport.dart';
import 'package:wounono_covid/services/fetchAirportsList.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/diplay_error_toast.dart';
import 'package:wounono_covid/utils/helper.dart';
import 'package:wounono_covid/widgets/app_bar/in_page_app_bar.dart';


class CheckInPage extends StatefulWidget {

  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {

  Future<List<Airport>> futureAirports;
  List<Airport> _airports = [];
  static String _displayStringForOption(Airport option) => option.name;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.scaffoldBackgroundColor,
        appBar: in_page_app_bar(context, 'Voyager aux Comores'),
        body:
        Stack(
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: kToolbarHeight / 4,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                decoration: BoxDecoration(
                                  color: Constants.primaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Aeroport d'arrivée : ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(5.0),
                                    ),
                                    Text(
                                      "Aéroport international Prince Saïd Ibrahim (HAH)".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                  child: new Material(
                                      color: Colors.transparent,
                                      child: new InkWell(
                                        borderRadius: BorderRadius.circular(11.0),
                                        onTap: () => {
                                          print('Checkin card')
                                        },
                                      )
                                  )
                              )
                            ],
                          )
                      ),

                      SizedBox(
                        height: kToolbarHeight / 4,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                          "Vos informations de vol"
                                      ),
                                    ),
                                    Icon(
                                      Icons.check_circle,
                                      color: Constants.primaryColor,
                                    )
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                  child: new Material(
                                      color: Colors.transparent,
                                      child: new InkWell(
                                        borderRadius: BorderRadius.circular(11.0),
                                        onTap: () => {
                                          nextScreen(context, '/travel-info-form')
                                        },
                                      )
                                  )
                              )
                            ],
                          )
                      ),
                      SizedBox(
                        height: kToolbarHeight / 4,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                          "Vos informations personnelles"
                                      ),
                                    ),
                                    Icon(
                                      Icons.check_circle,
                                      color: Constants.primaryColor,
                                    )
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                  child: new Material(
                                      color: Colors.transparent,
                                      child: new InkWell(
                                        borderRadius: BorderRadius.circular(11.0),
                                        onTap: () => {
                                          nextScreen(context, '/travel-personnal-form')
                                        },
                                      )
                                  )
                              )

                            ],
                          )
                      ),
                      SizedBox(
                        height: kToolbarHeight / 4,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                      "Formulaire de consentement"
                                  ),
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Constants.primaryColor,
                                )
                              ],
                            ),
                          )
                      ),


                    ],
                  ),
                )
            )
          ],
        )
    );
  }

  /*Future<void> _fetchData() async {

    /*var airports = await fetchAirportsList().catchError(
            (e){
          showErrorToast('Erreur reseau. Veuillez reesayer plus tard');
        }
    );*/
    List<Airport> dmap = await fetchAirportsList().catchError((e){
      showErrorToast('Erreur reseau. Veuillez reesayer plus tard');
    });
    print(dmap);
    setState(() {
      _airports = dmap;
    });

  }*/


}
