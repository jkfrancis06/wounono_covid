import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/widgets/travel/Tabs/familyScreen.dart';
import 'package:wounono_covid/widgets/travel/Tabs/personnalScreen.dart';

class PersonnalInfo extends StatefulWidget {

  @override
  _PersonnalInfoState createState() => _PersonnalInfoState();
}

class _PersonnalInfoState extends State<PersonnalInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr')
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
        primaryColor: Constants.scaffoldBackgroundColor, //Changing this will change the color of the TabBar
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
        accentColor: Constants.primaryColor,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Constants.scaffoldBackgroundColor,
          appBar: AppBar(
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
                      'Vos informations personnelles',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(18)
                      ),
                    )
                  ]
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: "INFORMATIONS PERSONNELLES"),
                Tab(text: "INFOS DE FAMILLE")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              PersonnalScreen(),
              FamiyScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
