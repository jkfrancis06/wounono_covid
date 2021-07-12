import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wounono_covid/models/sizeConfig.dart';
import 'package:wounono_covid/pages/dashboard.dart';
import 'package:wounono_covid/pages/home.dart';
import 'package:wounono_covid/pages/settings/country_list.dart';
import 'package:wounono_covid/pages/settings/user_informations.dart';
import 'package:wounono_covid/pages/sign/loginPage.dart';
import 'package:wounono_covid/pages/startup.dart';
import 'package:wounono_covid/pages/travel/checkInPage.dart';
import 'package:wounono_covid/pages/travel/personnalInfo.dart';
import 'package:wounono_covid/pages/travel/travelInfoForm.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wounono_covid/widgets/travel/Tabs/dialog/parentInfoDialog.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [
          const Locale('en', 'US'), // American English
          const Locale('he', 'IL'), // Israeli Hebrew
          const Locale('fr', 'FR'), // francais France
          // ...
        ],
        debugShowCheckedModeBanner: false,
        title: "Unono Covid-19",
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Startup();
      });
    case "/home":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Dashboard();
      });
    case "/login":
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      });
    case "/user-informations":
      return MaterialPageRoute(builder: (BuildContext context) {
        return UserInformations();
      });
    case "/check-in":
      return MaterialPageRoute(builder: (BuildContext context) {
        return CheckInPage();
      });
    case "/nationalite":
      return MaterialPageRoute(builder: (BuildContext context) {
        return CountryList();
      });
    case "/travel-info-form":
      return MaterialPageRoute(builder: (BuildContext context) {
        return TravelInfoForm();
      });
    case "/travel-personnal-form":
      return MaterialPageRoute(builder: (BuildContext context) {
        return PersonnalInfo();
      });
    case "/parentInfoDialog":
      return MaterialPageRoute(builder: (BuildContext context) {
        return ParentInfoDialog();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Startup();
      });
  }
}
