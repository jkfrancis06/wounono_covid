import 'package:flutter/material.dart';
import 'package:wounono_covid/widgets/dashboard/user_health_status.dart';
import 'package:wounono_covid/widgets/dashboard/user_top_card.dart';
import 'package:wounono_covid/widgets/dashboard/user_vaccine_status.dart';
import 'package:wounono_covid/widgets/general/internet_connectivity.dart';
import 'package:wounono_covid/widgets/travel/checkin_card.dart';
import 'package:wounono_covid/widgets/travel/travel_history_card.dart';

class DashboardScreen extends StatefulWidget {

  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();
  }

  // Track active index
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: kToolbarHeight / 4,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: UserTopCard(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Row(
                      children: [
                        CheckinCard(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.006,
                        ),
                        TravelHistoryCard()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mon carnet de santé",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Voir tout",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(
                            color: Colors.grey,
                          ),
                        )
                      ],
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
                      child: UserHealthStatus(),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mon Statut vaccinal",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
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
                      child: UserVaccineStatus(),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('fab pressed');
        },
        child: const Icon(
          Icons.qr_code_2,
          size: 35.0,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}
