import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/widgets/app_bar/in_page_app_bar.dart';

class UserInformations extends StatefulWidget {
  @override
  _UserInformationsState createState() => _UserInformationsState();
}

class _UserInformationsState extends State<UserInformations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: in_page_app_bar(context, 'Mettre a jour mon profil'),
      body:
      Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: kToolbarHeight / 4,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Nom : ',
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(5.0),
                        ),
                        Container(
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                hoverColor: Constants.primaryColor,
                                border: OutlineInputBorder(),
                                hintText: 'Entrer votre nom ici',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                            )
                        )
                      ],
                    )
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prenoms : ',
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(5.0),
                        ),
                        Container(
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                hoverColor: Constants.primaryColor,
                                border: OutlineInputBorder(),
                                hintText: 'Enter votre prenom ici',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                            )
                        )
                      ],
                    )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
