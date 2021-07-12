import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/helper.dart';

class Startup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Image.asset(
                        "assets/images/startup.jpg",
                        scale: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 24.0,
                ),
                decoration: BoxDecoration(
                  color: Constants.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      "Bienvenue sur Unono Covid 19",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Constants.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Luttons ensemble contre le coronavirus",
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    // Let's create a generic button widget
                    InkWell(
                      onTap: (){
                        nextScreen(context, '/login');
                      },
                      child: Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(48.0),
                        decoration: BoxDecoration(
                          color: Constants.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(169, 176, 185, 0.42),
                              spreadRadius: 0,
                              blurRadius: 8.0,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Connexion',
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(48.0),
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(169, 176, 185, 0.42),
                              spreadRadius: 0,
                              blurRadius: 8.0,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "S'inscrire",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
