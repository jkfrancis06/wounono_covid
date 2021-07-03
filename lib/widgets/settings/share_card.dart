import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Stack(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: ScreenUtil().setWidth(30.0),
                        height: ScreenUtil().setHeight(30.0),
                        child: Image.asset('assets/images/share.png')
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(5.0),
                    ),
                    Expanded(
                      child: Text(
                        "Partagez l'application",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(
                          color: Colors.black,
                        ),
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
