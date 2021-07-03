import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wounono_covid/pages/notifications.dart';
import 'package:wounono_covid/pages/settings.dart';
import 'package:wounono_covid/pages/statistics.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/widgets/general/internet_connectivity.dart';

import 'dashboard.dart';
import 'information.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Track active index
  int activeIndex = 0;

  final List<Widget> _pageOptions = [
    Dashboard(),
    Informations(),
    Statistics(),
    Notifications(),
    Settings(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        buttonBackgroundColor: Constants.primaryColor,
        items: [
          Icon(
            FlutterIcons.ios_home_ion,
            size: 30.0,
            color: activeIndex == 0 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.info_outline_mdi,
            size: 30.0,
            color: activeIndex == 1 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.piechart_ant,
            size: 30.0,
            color: activeIndex == 2 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.bells_ant,
            size: 30.0,
            color: activeIndex == 3 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.setting_ant,
            size: 30.0,
            color: activeIndex == 4 ? Colors.white : Color(0xFFC8C9CB),
          ),
        ],
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
              children: [
                Image.asset(
                  'assets/images/covid.png',
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: MediaQuery.of(context).size.width * 0.10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Text(
                  Constants.appName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(18)
                  ),
                )
              ]
          ),
        ),
        backgroundColor: Constants.scaffoldBackgroundColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0,0,5,0),
            child: Row(
              children: [
                OutlinedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: Text(
                      "Besoin d'aide ?",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: Stack(
        children: [
          IndexedStack(
            index: activeIndex,
            children: _pageOptions,
          ),
          InternetConnectivity()
        ],
      )




    );
  }


}
