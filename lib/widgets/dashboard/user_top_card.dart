import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wounono_covid/models/user.dart';
import 'package:wounono_covid/pages/settings/user_informations.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/helper.dart';

class UserTopCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final User user = User(
        firstname: 'Ahmed',
        lastname: 'Ibrahima'.toUpperCase(),
        country: 'Comoros',
        passportNumber: 'EB33432',
        phoneNumber: '+2693355558',
        gender: 1,
        birthdate: DateTime(1990,05,22)
    );


    return Stack(
      children: [
        Container(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/user_card.png',
                  ),
                  fit: BoxFit.fill,

                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(11.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: ScreenUtil().setWidth(55.0),
                          height: ScreenUtil().setHeight(55.0),
                          child: Image.asset('assets/images/user_icon.png')
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(5.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Flexible(child: Text(
                                    user.firstname +' '+ user.lastname ,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),),
                                ],
                              ),
                            ),

                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.assistant_photo_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(5.0),
                                  ),
                                  Text(
                                    user.country,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.assignment_ind_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(5.0),
                                  ),
                                  Text(
                                    user.passportNumber,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(5.0),
                                  ),
                                  Text(
                                    user.phoneNumber,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                    height: 20,
                    thickness: 1.0,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(150.0),
                        child: Column(
                          children: [
                            Text(
                              'Sexe :',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              _getGenderFromInt(user.gender),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(150.0),
                        child: Column(
                          children: [
                            Text(
                              'Âge :',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "33 Années" ,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
          ),
        ),
        Positioned.fill(
            child: new Material(
                color: Colors.transparent,
                child: new InkWell(
                  borderRadius: BorderRadius.circular(11.0),
                  onTap: () => {
                    nextScreen(context, "/user-informations")
                  },
                )
            )
        )
      ],
    );
  }
  
  
  _getGenderFromInt(int gender){
    switch(gender){
      case (1): {
        return "Homme";
      }
      case (2): {
        return "Femme";
      }
      default: {
        return "--";
      }
    }
  }
}
