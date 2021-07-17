import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wounono_covid/pages/dashboardScreen.dart';
import 'package:wounono_covid/pages/homeScreen.dart';
import 'package:wounono_covid/pages/introScreen.dart';
import 'package:wounono_covid/pages/location.dart';
import 'package:wounono_covid/pages/settings/country_list.dart';
import 'package:wounono_covid/pages/settings/user_informationsScreen.dart';
import 'package:wounono_covid/pages/sign/loginScreen.dart';
import 'package:wounono_covid/pages/sign/signInScreen.dart';
import 'package:wounono_covid/pages/sign/statusChoiceScreen.dart';
import 'package:wounono_covid/pages/startupScreen.dart';
import 'package:wounono_covid/pages/travel/checkInScreen.dart';
import 'package:wounono_covid/pages/travel/personnalInfoScreen.dart';
import 'package:wounono_covid/pages/travel/travelInfoFormScreen.dart';
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
        supportedLocales: [
          const Locale('fr')
        ],
        localizationsDelegates: [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: "Unono Covid-19",
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        initialRoute: "/welcome",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}




Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return StartupScreen();
      });
    case "/welcome":
      return MaterialPageRoute(builder: (BuildContext context) {
        return IntroScreen();
      });
    case "/home":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return DashboardScreen();
      });
    case "/login":
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoginScreen();
      });
    case "/sign-in":
      return MaterialPageRoute(builder: (BuildContext context) {
        return SignInScreen();
      });
    case "/user-informations":
      return MaterialPageRoute(builder: (BuildContext context) {
        return UserInformationsScreen();
      });
    case "/check-in":
      return MaterialPageRoute(builder: (BuildContext context) {
        return CheckInScreen();
      });
    case "/nationalite":
      return MaterialPageRoute(builder: (BuildContext context) {
        return CountryList();
      });
    case "/travel-info-form":
      return MaterialPageRoute(builder: (BuildContext context) {
        return TravelInfoFormScreen();
      });
    case "/travel-personnal-form":
      return MaterialPageRoute(builder: (BuildContext context) {
        return PersonnalInfoScreen();
      });
    case "/parentInfoDialog":
      return MaterialPageRoute(builder: (BuildContext context) {
        return ParentInfoDialog();
      });

    case "/status-choice":
      return MaterialPageRoute(builder: (BuildContext context) {
        return StatusChoiceScreen();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return StartupScreen();
      });
  }
}
