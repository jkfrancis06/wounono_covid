import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wounono_covid/pages/dashboard.dart';
import 'package:wounono_covid/pages/login.dart';
import 'package:wounono_covid/utils/constants.dart';

class BottomBar extends StatefulWidget {
  final activeIndex;

  BottomBar({this.activeIndex});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int activeIndex = 0;
  final _pageOptions = [
    Dashboard(),
    Login()
  ];
  @override
  Widget build(BuildContext context) {
    print(activeIndex);
    return Container();
  }
}
