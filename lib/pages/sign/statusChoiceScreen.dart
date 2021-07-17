import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wounono_covid/pages/sign/signInScreen.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/helper.dart';

class StatusChoiceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "assets/images/virus.png",
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 15.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                FlutterIcons.keyboard_backspace_mdi,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Choisir votre statut",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Flexible(
                        child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              minHeight:
                              MediaQuery.of(context).size.height - 180.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Constants.scaffoldBackgroundColor,
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: ScreenUtil().setWidth(40.0),
                                                    height: ScreenUtil().setHeight(40.0),
                                                    child: Image.asset('assets/images/citizen.png')
                                                ),
                                                SizedBox(
                                                  width: ScreenUtil().setWidth(10.0),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Citoyen",
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1
                                                                  .copyWith(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        "Choisissez cette option si vous êtes citoyen comorien",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            .copyWith(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                    Positioned.fill(
                                        child: new Material(
                                            color: Colors.transparent,
                                            child: new InkWell(
                                              borderRadius: BorderRadius.circular(11.0),
                                              onTap: () => {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => SignInScreen(consumerType: 1),
                                                  ),
                                                )
                                              },
                                            )
                                        )
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 10.0,
                                ),

                                Stack(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Constants.scaffoldBackgroundColor,
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: ScreenUtil().setWidth(40.0),
                                                    height: ScreenUtil().setHeight(40.0),
                                                    child: Image.asset('assets/images/resident.png')
                                                ),
                                                SizedBox(
                                                  width: ScreenUtil().setWidth(10.0),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Resident",
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1
                                                                  .copyWith(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        "Choisissez cette option si vous êtes resident sur le territoire comorien",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            .copyWith(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                    Positioned.fill(
                                        child: new Material(
                                            color: Colors.transparent,
                                            child: new InkWell(
                                              borderRadius: BorderRadius.circular(11.0),
                                              onTap: () => {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => SignInScreen(consumerType: 2),
                                                  ),
                                                )
                                              },
                                            )
                                        )
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 10.0,
                                ),

                                Stack(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Constants.scaffoldBackgroundColor,
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: ScreenUtil().setWidth(40.0),
                                                    height: ScreenUtil().setHeight(40.0),
                                                    child: Image.asset('assets/images/foreigner.png')
                                                ),
                                                SizedBox(
                                                  width: ScreenUtil().setWidth(10.0),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Visiteur",
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1
                                                                  .copyWith(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        "Choisissez cette option si vous êtes visiteur",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            .copyWith(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                    Positioned.fill(
                                        child: new Material(
                                            color: Colors.transparent,
                                            child: new InkWell(
                                              borderRadius: BorderRadius.circular(11.0),
                                              onTap: () => {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => SignInScreen(consumerType: 3),
                                                  ),
                                                )
                                              },
                                            )
                                        )
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
