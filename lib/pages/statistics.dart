import 'package:flutter/material.dart';
import 'package:wounono_covid/models/covidStats.dart';
import 'package:wounono_covid/services/fetchCovidStat.dart';

class Statistics extends StatefulWidget {

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  Future<CovidStats> futureCovidStats;

  @override
  void initState() {
    super.initState();
    futureCovidStats = fetchCovidStat();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CovidStats>(
      future: futureCovidStats,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("${snapshot.data.updated}");
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
