import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wounono_covid/utils/constants.dart';

class StopCovidCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
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
                        child: Container(
                            width: ScreenUtil().setWidth(55.0),
                            height: ScreenUtil().setHeight(55.0),
                            child: Image.asset('assets/images/stop_covid.png')
                        ),
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
                                Text(
                                  "Prevention",
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
                            "Vous aider à eviter l'infection",
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
                    print('Checkin card')
                  },
                )
            )
        )
      ],
    );
  }

}
