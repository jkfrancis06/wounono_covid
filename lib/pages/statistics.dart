import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/flutter_skeleton.dart';
import 'package:wounono_covid/models/covidStats.dart';
import 'package:wounono_covid/models/vaccineStat.dart';
import 'package:wounono_covid/services/fetchCovidStat.dart';
import 'package:wounono_covid/services/fetchVaccineStat.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/date_helper.dart';
import 'package:wounono_covid/utils/diplay_error_toast.dart';
import 'package:wounono_covid/utils/number_display.dart';

class Statistics extends StatefulWidget {

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  Future<CovidStats> futureCovidStats;
  Future<VaccineStat> futureVaccineStats;
  int vaccineDoses;
  bool has_error = false;

  @override
  void initState() {
    super.initState();
    _pullRefresh();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([futureCovidStats,futureVaccineStats]).catchError((e){ print('api error'); }),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData && snapshot.data[0]!= null && snapshot.data[1]!= null){
              print(' data');
              return RefreshIndicator(
                color: Constants.primaryColor,
                onRefresh: _pullRefresh,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      _showData(snapshot),
                    ],
                  ),
                ),
              );
            }
            _showError(snapshot);
          }
          return _showError(snapshot);

      },

    );
  }


  Widget _showError(AsyncSnapshot snapshot){
    return RefreshIndicator(
      color: Constants.primaryColor,
      onRefresh: _pullRefresh,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            _defaultView(),
          ],
        ),
      ),
    );
  }


  Widget _showData(AsyncSnapshot snapshot){
    if (snapshot.hasData) {
      return Column(
        children: [
          SizedBox(
            height: kToolbarHeight / 4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: Container(
                decoration: BoxDecoration(
                  color: Constants.blueColor,
                  borderRadius: BorderRadius.circular(11.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: ScreenUtil().setWidth(55.0),
                            height: ScreenUtil().setHeight(55.0),
                            child: Image.asset('assets/images/vaccine2.png')
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(5.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Center(
                                  child: Text(
                                    "Nombre de doses de vaccin administrées",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                        color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(10.0),
                              ),
                              Center(
                                child: Text(
                                  "${numberDisplay(_getVaccineDosesFromMap(snapshot.data[1].timeline))}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.0),
                  color: Colors.white,

                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: ScreenUtil().setWidth(55.0),
                            height: ScreenUtil().setHeight(55.0),
                            child: Image.asset('assets/images/cough_red.png')
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(5.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child:  Center(
                                  child: Text(
                                    "Cas cumulés",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                        color: Color.fromRGBO(74, 77, 84, 0.7),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ),
                              Center(
                                child: Text(
                                  "${numberDisplay(snapshot.data[0].cases)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),


                    SizedBox(
                      height: ScreenUtil().setHeight(10.0),
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: ScreenUtil().setWidth(55.0),
                            height: ScreenUtil().setHeight(55.0),
                            child: Image.asset('assets/images/quarantine.png')
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(5.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Center(
                                  child: Text(
                                    "Cas actifs",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                        color: Color.fromRGBO(74, 77, 84, 0.7),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ),
                              Center(
                                child: Text(
                                  "${numberDisplay(snapshot.data[0].active)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: ScreenUtil().setHeight(10.0),
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: ScreenUtil().setWidth(55.0),
                            height: ScreenUtil().setHeight(55.0),
                            child: Image.asset('assets/images/recovered.png')
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(5.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Center(
                                    child: Text(
                                      "Guéris cumulés",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                          color: Color.fromRGBO(74, 77, 84, 0.7),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )
                              ),
                              Center(
                                child: Text(
                                  "${numberDisplay(snapshot.data[0].recovered)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),


                    SizedBox(
                      height: ScreenUtil().setHeight(10.0),
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: ScreenUtil().setWidth(55.0),
                            height: ScreenUtil().setHeight(55.0),
                            child: Image.asset('assets/images/gravestone.png')
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(5.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Center(
                                    child: Text(
                                      "Décès cumulés",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                          color: Color.fromRGBO(74, 77, 84, 0.7),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )
                              ),
                              Center(
                                child: Text(
                                  "${numberDisplay(snapshot.data[0].deaths)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),



                  ],
                )
            ),

          ),

          SizedBox(
            height: ScreenUtil().setHeight(10.0),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: Row(
              children: [
                Text(
                  'Données mis a jour le : ',
                  style: TextStyle(
                    color: Color.fromRGBO(74, 77, 84, 0.7),
                    fontWeight: FontWeight.w100
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(5.0),
                ),
                Text(
                "${dateFromTimeStamp(snapshot.data[0].updated)}",
                  style: TextStyle(
                      color: Color.fromRGBO(74, 77, 84, 0.7),
                      fontWeight: FontWeight.w100
                  ),
                ),
              ],
            ),
          ),

        ],
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
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
              backgroundColor: Constants.blueColor,
              barCount: 0,
              isAnimation: true,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child:  CardSkeleton(
            style: SkeletonStyle(
              theme: SkeletonTheme.Light,
              isShowAvatar: false,
              isCircleAvatar: true,
              borderRadius: BorderRadius.all(Radius.circular(11.0)),
              padding: EdgeInsets.all(32.0),
              barCount: 8,
              isAnimation: true,
            ),
          ),
        ),

      ],
    );
  }

  _getVaccineDosesFromMap(Map data) {
      var doses;
      data.forEach(
              (k,v) => doses = v
      );
      return doses;
  }

  Future<void> _pullRefresh() async {

    await fetchCovidStat().catchError(
        (e){
          showErrorToast('Erreur reseau. Veuillez reesayer plus tard');
        }
    );
    await fetchVaccineStat().catchError(
        (e){
          showErrorToast('Erreur reseau. Veuillez reesayer plus tard');
        }
    );
    setState(() {
      futureCovidStats =  fetchCovidStat();
      futureVaccineStats = fetchVaccineStat();
    });
  }

}
