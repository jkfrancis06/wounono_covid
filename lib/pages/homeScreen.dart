import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wounono_covid/pages/dashboardScreen.dart';
import 'package:wounono_covid/pages/informationScreen.dart';
import 'package:wounono_covid/pages/notificationsScreen.dart';
import 'package:wounono_covid/pages/settingsScreen.dart';
import 'package:wounono_covid/pages/statisticsScreen.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/helper.dart';
import 'package:wounono_covid/widgets/general/internet_connectivity.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  initState() {
    super.initState();
    _checkPermission();

  }

  // Track active index
  int activeIndex = 0;

  DateTime currentBackPressTime;


  final List<Widget> _pageOptions = [
    DashboardScreen(),
    InformationsScreen(),
    StatisticsScreen(),
    NotificationsScreen(),
    SettingsScreen(),
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
                    onPressed: (){
                      nextScreen(context, '/location');
                    },
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
      body: WillPopScope(
        onWillPop: showExitPopup,
        child:
          Stack(
            children: [
              IndexedStack(
                index: activeIndex,
                children: _pageOptions,
              ),
              InternetConnectivity()
            ],
          ),
      )




    );
  }


  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quitter'),
        content: Text('Voulez vous quitter l\'application?'),
        actions:[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Constants.primaryColor
            ),
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('Non'),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Constants.primaryColor
            ),
            onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            //return true when click on "Yes"
            child:Text('Oui'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }

  _checkPermission()async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    print(status);
    print(statuses[Permission.location]);
  }

}
