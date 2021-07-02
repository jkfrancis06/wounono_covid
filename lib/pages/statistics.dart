import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wounono_covid/models/covidStats.dart';
import 'package:wounono_covid/models/vaccineStat.dart';
import 'package:wounono_covid/services/fetchCovidStat.dart';
import 'package:wounono_covid/services/fetchVaccineStat.dart';
import 'package:wounono_covid/utils/constants.dart';

class Statistics extends StatefulWidget {

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  Future<CovidStats> futureCovidStats;
  Future<VaccineStat> futureVaccineStats;
  int vaccineDoses;

  @override
  void initState() {
    super.initState();
    futureCovidStats = fetchCovidStat();
    futureVaccineStats = fetchVaccineStat();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([futureCovidStats,futureVaccineStats]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {

          return RefreshIndicator(
            child: Stack(
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.all(8.0),
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                ),
                _showData(snapshot)],
            ),
            onRefresh: _pullRefresh,
        );

      },
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
                                child: Row(
                                  children: [
                                    Text(
                                      "Nombre de doses de vaccin administrées",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(10.0),
                              ),
                              Center(
                                child: Text(
                                  "${_getVaccineDosesFromMap(snapshot.data[1].timeline)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                    color: Colors.white,
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

          Text("${snapshot.data[0].updated}"),
          Text("${snapshot.data[1].country}")
        ],
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
  }

  _getVaccineDosesFromMap(Map data) {
      var doses;
      data.forEach(
              (k,v) => doses = v
      );
      return doses;
  }

  Future<void> _pullRefresh() async {
    setState(() {
      futureCovidStats = fetchCovidStat();
      futureVaccineStats = fetchVaccineStat();
    });
  }

}
