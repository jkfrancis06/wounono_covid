import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/helper.dart';

class CheckinCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width*0.465,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      FlutterIcons.plane_departure_faw5s,
                      size: 25,
                      color: Constants.primaryColor,
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10.0),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Flexible(child:  Text(
                                  "Venir aux comores",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),)
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Flexible(child:  Text(
                                  "Procedures pour venir aux comores",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                    color: Colors.black,
                                  ),
                                ),)
                              ],
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
                    nextScreen(context, '/check-in')
                  },
                )
            )
        )
      ]
    );
  }
}
