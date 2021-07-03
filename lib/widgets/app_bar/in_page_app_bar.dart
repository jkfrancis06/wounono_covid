
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wounono_covid/utils/constants.dart';

in_page_app_bar(context,page_name){
  return AppBar(
    automaticallyImplyLeading: false,
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
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Text(
              page_name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(18)
              ),
            )
          ]
      ),
    ),
    backgroundColor: Constants.scaffoldBackgroundColor,
  );
}